& {
    $ErrorActionPreference = "Continue"

    $HermesRoot = "F:\SP\Hermes"

    Write-Host ""
    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host " HERMES FULL SHUTDOWN" -ForegroundColor Cyan
    Write-Host " STOP RUNTIME + PREVENT HERMES AUTOSTART" -ForegroundColor Cyan
    Write-Host " OLLAMA / MODELS / HISTORY ARE NOT TOUCHED" -ForegroundColor Cyan
    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host ""

    # ---------------------------------------------------------
    # 1. STOP HERMES WINDOWS PROCESSES
    # ---------------------------------------------------------
    Write-Host "[1/5] Stopping Hermes Windows processes..." -ForegroundColor Yellow

    for ($Pass = 1; $Pass -le 4; $Pass++) {

        $HermesProcesses = @(
            Get-CimInstance Win32_Process -ErrorAction SilentlyContinue |
            Where-Object {
                $Cmd = [string]$_.CommandLine
                $Exe = [string]$_.ExecutablePath
                $Name = [string]$_.Name

                (
                    $Exe -like "$HermesRoot*" -or
                    $Cmd -like "*$HermesRoot*" -or
                    $Cmd -match '(?i)hermes-agent' -or
                    $Cmd -match '(?i)\bhermes(\.exe)?\b'
                ) -and
                $Name -notmatch '(?i)^ollama(\.exe)?$'
            }
        )

        if ($HermesProcesses.Count -eq 0) { break }

        foreach ($P in $HermesProcesses) {
            try {
                Write-Host ("  STOP PID {0}  {1}" -f $P.ProcessId,$P.Name)
                Stop-Process -Id $P.ProcessId -Force -ErrorAction Stop
            }
            catch {
                Write-Host ("  WARN PID {0}: {1}" -f $P.ProcessId,$_.Exception.Message) -ForegroundColor DarkYellow
            }
        }

        Start-Sleep -Seconds 2
    }

    # ---------------------------------------------------------
    # 2. STOP HERMES DOCKER CONTAINERS - DO NOT DELETE
    # ---------------------------------------------------------
    Write-Host ""
    Write-Host "[2/5] Stopping Hermes Docker containers..." -ForegroundColor Yellow

    if (Get-Command docker -ErrorAction SilentlyContinue) {

        $Containers = @(
            docker ps --format '{{.ID}}|{{.Names}}|{{.Labels}}' 2>$null |
            Where-Object {
                $_ -match '(?i)hermes' -or
                $_ -match 'hermes-agent=1'
            }
        )

        foreach ($Row in $Containers) {
            $Parts = $Row -split '\|',3
            $Id   = $Parts[0]
            $Name = $Parts[1]

            if ($Id) {
                Write-Host "  STOP CONTAINER $Name [$Id]"
                docker stop --time 10 $Id 2>$null | Out-Null
            }
        }

        if ($Containers.Count -eq 0) {
            Write-Host "  No running Hermes Docker containers."
        }
    }
    else {
        Write-Host "  Docker CLI unavailable - skipped."
    }

    # ---------------------------------------------------------
    # 3. STOP + DISABLE HERMES WINDOWS SERVICES
    # ---------------------------------------------------------
    Write-Host ""
    Write-Host "[3/5] Stopping Hermes-specific Windows services..." -ForegroundColor Yellow

    $HermesServices = @(
        Get-CimInstance Win32_Service -ErrorAction SilentlyContinue |
        Where-Object {
            $_.Name        -match '(?i)hermes' -or
            $_.DisplayName -match '(?i)hermes' -or
            $_.PathName    -match '(?i)hermes'
        }
    )

    foreach ($S in $HermesServices) {

        Write-Host "  SERVICE: $($S.Name)"

        try {
            if ($S.State -ne "Stopped") {
                Stop-Service -Name $S.Name -Force -ErrorAction Stop
            }
        }
        catch {
            Write-Host "    Stop warning: $($_.Exception.Message)" -ForegroundColor DarkYellow
        }

        try {
            Set-Service -Name $S.Name -StartupType Disabled -ErrorAction Stop
            Write-Host "    Disabled autostart."
        }
        catch {
            Write-Host "    Disable warning: $($_.Exception.Message)" -ForegroundColor DarkYellow
        }
    }

    if ($HermesServices.Count -eq 0) {
        Write-Host "  No Hermes Windows services found."
    }

    # ---------------------------------------------------------
    # 4. DISABLE HERMES SCHEDULED TASKS
    # ---------------------------------------------------------
    Write-Host ""
    Write-Host "[4/5] Disabling Hermes scheduled tasks..." -ForegroundColor Yellow

    $HermesTasks = @(
        Get-ScheduledTask -ErrorAction SilentlyContinue |
        Where-Object {
            $ActionText = (
                $_.Actions |
                ForEach-Object {
                    "$($_.Execute) $($_.Arguments) $($_.WorkingDirectory)"
                }
            ) -join " "

            $_.TaskName -match '(?i)hermes' -or
            $_.TaskPath -match '(?i)hermes' -or
            $ActionText -match '(?i)hermes'
        }
    )

    foreach ($T in $HermesTasks) {

        Write-Host "  TASK: $($T.TaskPath)$($T.TaskName)"

        try {
            Stop-ScheduledTask `
                -TaskName $T.TaskName `
                -TaskPath $T.TaskPath `
                -ErrorAction SilentlyContinue
        }
        catch {}

        try {
            Disable-ScheduledTask `
                -TaskName $T.TaskName `
                -TaskPath $T.TaskPath `
                -ErrorAction Stop | Out-Null

            Write-Host "    Disabled."
        }
        catch {
            Write-Host "    Disable warning: $($_.Exception.Message)" -ForegroundColor DarkYellow
        }
    }

    if ($HermesTasks.Count -eq 0) {
        Write-Host "  No Hermes scheduled tasks found."
    }

    # ---------------------------------------------------------
    # 5. FINAL VERIFICATION
    # ---------------------------------------------------------
    Start-Sleep -Seconds 3

    Write-Host ""
    Write-Host "[5/5] Verifying shutdown..." -ForegroundColor Yellow

    $RemainingProcesses = @(
        Get-CimInstance Win32_Process -ErrorAction SilentlyContinue |
        Where-Object {
            $Cmd = [string]$_.CommandLine
            $Exe = [string]$_.ExecutablePath

            (
                $Exe -like "$HermesRoot*" -or
                $Cmd -like "*$HermesRoot*" -or
                $Cmd -match '(?i)hermes-agent'
            )
        }
    )

    $RemainingContainers = @()

    if (Get-Command docker -ErrorAction SilentlyContinue) {
        $RemainingContainers = @(
            docker ps --format '{{.ID}}|{{.Names}}|{{.Labels}}' 2>$null |
            Where-Object {
                $_ -match '(?i)hermes' -or
                $_ -match 'hermes-agent=1'
            }
        )
    }

    Write-Host ""
    Write-Host "============================================================" -ForegroundColor Cyan

    if (
        $RemainingProcesses.Count -eq 0 -and
        $RemainingContainers.Count -eq 0
    ) {
        Write-Host " HERMES FULL SHUTDOWN: PASS" -ForegroundColor Green
        Write-Host ""
        Write-Host " No Hermes Windows processes detected."
        Write-Host " No running Hermes Docker containers detected."
        Write-Host " Hermes-specific services/tasks found were disabled."
        Write-Host ""
        Write-Host " Ollama was intentionally left alone."
    }
    else {
        Write-Host " HERMES FULL SHUTDOWN: INCOMPLETE" -ForegroundColor Red

        if ($RemainingProcesses.Count) {
            Write-Host ""
            Write-Host " Remaining processes:" -ForegroundColor Red
            $RemainingProcesses |
                Select-Object ProcessId,Name,ExecutablePath,CommandLine |
                Format-Table -Wrap
        }

        if ($RemainingContainers.Count) {
            Write-Host ""
            Write-Host " Remaining containers:" -ForegroundColor Red
            $RemainingContainers | ForEach-Object { Write-Host "  $_" }
        }
    }

    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host ""
}
