$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

# Signalproof Workbench GUI RD2 R6
# G0 RD1 HASH-PINNED BOOTSTRAP
# Downloads the exact governed G0 runner, verifies its SHA256, parses exact bytes,
# stages it into Quarantine Evidence without overwriting differing bytes, then executes.
# Run as the normal non-admin owner.

$ExpectedRunnerSha = "365941B1A96CF757EA67021E4A81A47B45A217F290310DCB805403530EDC374E"
$RunnerName = "SP-WORKBENCH-R6-G0-RD1.ps1"
$EvidenceRoot = "F:\Downloads\Quarantine\Evidence"
$Target = Join-Path $EvidenceRoot $RunnerName
$RawUrl = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/refs/heads/candidate/workbench-rd2-gui-build/tools/workbench/SP-WORKBENCH-R6-G0-RD1.ps1"
$Temp = Join-Path $env:TEMP ("SP-WORKBENCH-R6-G0-RD1-" + [Guid]::NewGuid().ToString("N") + ".ps1")

function Get-Sha256Upper {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw ("STOP: required file missing: " + $Path)
    }
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256 -ErrorAction Stop).Hash.ToUpperInvariant()
}

function Assert-Parse {
    param([string]$Path)
    $Tokens = $null
    $Errors = $null
    [System.Management.Automation.Language.Parser]::ParseFile(
        $Path,
        [ref]$Tokens,
        [ref]$Errors
    ) | Out-Null
    if ($null -ne $Errors -and @($Errors).Count -ne 0) {
        $Errors | ForEach-Object {
            Write-Host ("LINE " + $_.Extent.StartLineNumber + ", COL " + $_.Extent.StartColumnNumber + ": " + $_.Message) -ForegroundColor Red
        }
        throw ("STOP: PowerShell parser rejected exact file: " + $Path)
    }
}

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)
$IsAdmin = $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if ($IsAdmin) {
    throw "STOP: run this G0 bootstrap as the normal non-admin owner."
}

if (-not (Test-Path -LiteralPath $EvidenceRoot -PathType Container)) {
    throw ("STOP: Quarantine Evidence root missing: " + $EvidenceRoot)
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD1 BOOTSTRAP" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ("USER       : " + $Identity.Name)
Write-Host ("SOURCE URL : " + $RawUrl)
Write-Host ("PINNED SHA : " + $ExpectedRunnerSha)
Write-Host ""

try {
    Invoke-WebRequest -UseBasicParsing -Uri $RawUrl -OutFile $Temp -ErrorAction Stop

    Assert-Parse $Temp
    $DownloadedSha = Get-Sha256Upper $Temp
    if ($DownloadedSha -ne $ExpectedRunnerSha) {
        throw ("STOP: downloaded G0 runner hash mismatch. Expected " + $ExpectedRunnerSha + " got " + $DownloadedSha)
    }
    Write-Host "PASS: downloaded G0 runner exact SHA256" -ForegroundColor Green

    if (Test-Path -LiteralPath $Target -PathType Leaf) {
        $ExistingSha = Get-Sha256Upper $Target
        if ($ExistingSha -ne $ExpectedRunnerSha) {
            throw ("STOP: target filename already exists with different bytes. Preserve it and use a new revision. Existing SHA256: " + $ExistingSha)
        }
        Write-Host "PASS: staged target already contains exact approved bytes" -ForegroundColor Green
    }
    else {
        Copy-Item -LiteralPath $Temp -Destination $Target -ErrorAction Stop
        $StagedSha = Get-Sha256Upper $Target
        if ($StagedSha -ne $ExpectedRunnerSha) {
            throw ("STOP: staged runner hash mismatch after copy. Got " + $StagedSha)
        }
        Write-Host ("PASS: staged exact runner: " + $Target) -ForegroundColor Green
    }

    Assert-Parse $Target
    Unblock-File -LiteralPath $Target -ErrorAction SilentlyContinue

    $WindowsPowerShell = Join-Path $env:SystemRoot "System32\WindowsPowerShell\v1.0\powershell.exe"
    if (-not (Test-Path -LiteralPath $WindowsPowerShell -PathType Leaf)) {
        throw ("STOP: Windows PowerShell missing: " + $WindowsPowerShell)
    }

    & $WindowsPowerShell -NoLogo -NoProfile -ExecutionPolicy Bypass -File $Target
    $ChildExit = $LASTEXITCODE
    if ($ChildExit -ne 0) {
        throw ("STOP: G0 runner returned exit code " + $ChildExit)
    }

    Write-Host ""
    Write-Host "G0 BOOTSTRAP COMPLETE" -ForegroundColor Green
    Write-Host "Return the G0 console output or R6-G0-SOURCE-LOCALIZATION.txt to the Builder chat."
}
finally {
    if (Test-Path -LiteralPath $Temp -PathType Leaf) {
        Remove-Item -LiteralPath $Temp -Force -ErrorAction SilentlyContinue
    }
}
