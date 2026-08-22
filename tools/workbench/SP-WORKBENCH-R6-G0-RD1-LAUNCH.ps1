$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

# Signalproof Workbench GUI RD2 R6 - G0 exact launcher
# Downloads the exact committed read-only R6-G0 runner from the Signalproof-Skills
# candidate branch, verifies SHA-256 + PowerShell parser state, stages it to the
# established Quarantine Evidence root, and executes it once.

$ExpectedRunnerSha = "365941B1A96CF757EA67021E4A81A47B45A217F290310DCB805403530EDC374E"
$RunnerName = "SP-WORKBENCH-R6-G0-RD1.ps1"
$Target = Join-Path "F:\Downloads\Quarantine\Evidence" $RunnerName
$RawUrl = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/candidate/workbench-rd2-gui-build/tools/workbench/SP-WORKBENCH-R6-G0-RD1.ps1"
$Temp = Join-Path $env:TEMP ("signalproof-" + [Guid]::NewGuid().ToString("N") + ".ps1")

function Stop-R6 {
    param([string]$Message)
    throw ("STOP: " + $Message)
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD1" -ForegroundColor Cyan
Write-Host " EXACT DOWNLOAD / HASH / PARSER / EXECUTION LAUNCHER" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""

if (Test-Path -LiteralPath $Target -PathType Leaf) {
    $ExistingSha = (Get-FileHash -LiteralPath $Target -Algorithm SHA256).Hash.ToUpperInvariant()
    if ($ExistingSha -eq $ExpectedRunnerSha) {
        Write-Host "PASS: exact R6-G0 runner already staged." -ForegroundColor Green
    }
    else {
        Stop-R6 ("target filename already exists with different bytes. Preserve it and use a fresh revision: " + $Target)
    }
}
else {
    try {
        Invoke-WebRequest -Uri $RawUrl -OutFile $Temp -UseBasicParsing -ErrorAction Stop
    }
    catch {
        Stop-R6 ("could not download exact R6-G0 runner from Signalproof-Skills: " + $_.Exception.Message)
    }

    $DownloadedSha = (Get-FileHash -LiteralPath $Temp -Algorithm SHA256).Hash.ToUpperInvariant()
    Write-Host ("EXPECTED SHA256 : " + $ExpectedRunnerSha)
    Write-Host ("DOWNLOADED SHA256: " + $DownloadedSha)

    if ($DownloadedSha -ne $ExpectedRunnerSha) {
        Remove-Item -LiteralPath $Temp -Force -ErrorAction SilentlyContinue
        Stop-R6 "downloaded R6-G0 runner SHA256 mismatch"
    }

    $Tokens = $null
    $ParseErrors = $null
    [System.Management.Automation.Language.Parser]::ParseFile(
        $Temp,
        [ref]$Tokens,
        [ref]$ParseErrors
    ) | Out-Null

    if ($null -ne $ParseErrors -and @($ParseErrors).Count -ne 0) {
        $ParseErrors | ForEach-Object {
            Write-Host ("LINE " + $_.Extent.StartLineNumber + ", COL " + $_.Extent.StartColumnNumber + ": " + $_.Message) -ForegroundColor Red
        }
        Remove-Item -LiteralPath $Temp -Force -ErrorAction SilentlyContinue
        Stop-R6 "downloaded exact runner parser validation failed"
    }

    Move-Item -LiteralPath $Temp -Destination $Target -ErrorAction Stop
    Write-Host ("PASS: exact R6-G0 runner staged: " + $Target) -ForegroundColor Green
}

$ActualSha = (Get-FileHash -LiteralPath $Target -Algorithm SHA256).Hash.ToUpperInvariant()
if ($ActualSha -ne $ExpectedRunnerSha) {
    Stop-R6 "staged R6-G0 runner identity changed"
}

$FinalTokens = $null
$FinalParseErrors = $null
[System.Management.Automation.Language.Parser]::ParseFile(
    $Target,
    [ref]$FinalTokens,
    [ref]$FinalParseErrors
) | Out-Null

if ($null -ne $FinalParseErrors -and @($FinalParseErrors).Count -ne 0) {
    Stop-R6 "exact staged R6-G0 parser validation failed"
}

Write-Host "PASS: exact staged runner hash and parser state verified." -ForegroundColor Green
Unblock-File -LiteralPath $Target -ErrorAction SilentlyContinue
Write-Host ""
Write-Host "EXECUTING R6-G0 ONCE..." -ForegroundColor Yellow
Write-Host ""
& $Target
