[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$HermesRoot
)

$ErrorActionPreference = "Continue"

try {
    $ResolvedHermesRoot = (Resolve-Path -LiteralPath $HermesRoot -ErrorAction Stop).Path.TrimEnd('\')
}
catch {
    Write-Error "Hermes root could not be resolved. No shutdown action was performed."
    exit 2
}

Write-Host ""
Write-Host "HERMES FULL SHUTDOWN" -ForegroundColor Cyan
Write-Host "Root: $ResolvedHermesRoot"
Write-Host "Ollama / models / histories / source are preserved." -ForegroundColor Cyan

function Get-HermesProcesses {
    @(
        Get-CimInstance Win32_Process -ErrorAction SilentlyContinue |
        Where-Object {
            $cmd = [string]$_.CommandLine
            $exe = [string]$_.ExecutablePath
            $name = [string]$_.Name
            (
                $exe -like "$ResolvedHermesRoot*" -or
                $cmd -like "*$ResolvedHermesRoot*" -or
                $cmd -match '(?i)hermes-agent'
            ) -and
            $name -notmatch '(?i)^ollama(\.exe)?$'
        }
    )
}

for ($pass = 1; $pass -le 4; $pass++) {
    $processes = @(Get-HermesProcesses)
    if ($processes.Count -eq 0) { break }
    foreach ($p in $processes) {
        try { Stop-Process -Id $p.ProcessId -Force -ErrorAction Stop }
        catch { Write-Warning ("PID {0}: {1}" -f $p.ProcessId, $_.Exception.Message) }
    }
    Start-Sleep -Seconds 2
}

$dockerAvailable = [bool](Get-Command docker -ErrorAction SilentlyContinue)
if ($dockerAvailable) {
    $containers = @(
        docker ps --format '{{.ID}}|{{.Names}}|{{.Labels}}' 2>$null |
        Where-Object { $_ -match '(?i)hermes' -or $_ -match 'hermes-agent=1' }
    )
    foreach ($row in $containers) {
        $parts = $row -split '\|',3
        if ($parts[0]) { docker stop --time 10 $parts[0] 2>$null | Out-Null }
    }
}

$services = @(
    Get-CimInstance Win32_Service -ErrorAction SilentlyContinue |
    Where-Object {
        $_.Name -match '(?i)hermes' -or
        $_.DisplayName -match '(?i)hermes' -or
        $_.PathName -like "*$ResolvedHermesRoot*"
    }
)
foreach ($svc in $services) {
    try {
        if ($svc.State -ne "Stopped") { Stop-Service -Name $svc.Name -Force -ErrorAction Stop }
    } catch { Write-Warning ("Service stop {0}: {1}" -f $svc.Name, $_.Exception.Message) }
    try { Set-Service -Name $svc.Name -StartupType Disabled -ErrorAction Stop }
    catch { Write-Warning ("Service disable {0}: {1}" -f $svc.Name, $_.Exception.Message) }
}

$tasks = @(
    Get-ScheduledTask -ErrorAction SilentlyContinue |
    Where-Object {
        $actionText = ($_.Actions | ForEach-Object { "$($_.Execute) $($_.Arguments) $($_.WorkingDirectory)" }) -join " "
        $_.TaskName -match '(?i)hermes' -or
        $_.TaskPath -match '(?i)hermes' -or
        $actionText -like "*$ResolvedHermesRoot*"
    }
)
foreach ($task in $tasks) {
    try { Stop-ScheduledTask -TaskName $task.TaskName -TaskPath $task.TaskPath -ErrorAction SilentlyContinue } catch {}
    try { Disable-ScheduledTask -TaskName $task.TaskName -TaskPath $task.TaskPath -ErrorAction Stop | Out-Null }
    catch { Write-Warning ("Task disable {0}{1}: {2}" -f $task.TaskPath, $task.TaskName, $_.Exception.Message) }
}

Start-Sleep -Seconds 3
$remainingProcesses = @(Get-HermesProcesses)
$remainingContainers = @()
if ($dockerAvailable) {
    $remainingContainers = @(
        docker ps --format '{{.ID}}|{{.Names}}|{{.Labels}}' 2>$null |
        Where-Object { $_ -match '(?i)hermes' -or $_ -match 'hermes-agent=1' }
    )
}

if ($remainingProcesses.Count -eq 0 -and $remainingContainers.Count -eq 0) {
    Write-Host "HERMES FULL SHUTDOWN: PASS" -ForegroundColor Green
    Write-Host "Ollama was intentionally left alone."
    exit 0
}

Write-Host "HERMES FULL SHUTDOWN: INCOMPLETE" -ForegroundColor Red
if ($remainingProcesses.Count) {
    $remainingProcesses | Select-Object ProcessId,Name,ExecutablePath,CommandLine | Format-Table -Wrap
}
if ($remainingContainers.Count) {
    $remainingContainers | ForEach-Object { Write-Host $_ }
}
exit 1
