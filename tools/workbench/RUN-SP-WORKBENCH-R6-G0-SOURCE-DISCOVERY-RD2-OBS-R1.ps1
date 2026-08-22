$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

# Signalproof Workbench R6 G0 RD2 Observability Recovery R1
# This wrapper does not alter the RD2 discriminator. It either recovers already-written
# evidence or executes the exact pinned RD2 runner with stdout/stderr capture.
# No product/production/Governor/Core/ACL/canonical-ledger mutation.

$Url = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/refs/heads/candidate/workbench-rd2-gui-build/tools/workbench/SP-WORKBENCH-R6-G0-SOURCE-DISCOVERY-RD2.ps1"
$Expected = "9AE22F26C9BDFCC868812E2B0746F70578D52FD748FD4A5B4A4F9710093C7684"
$Download = Join-Path $env:TEMP "SP-WORKBENCH-R6-G0-SOURCE-DISCOVERY-RD2.ps1"
$StdOut = Join-Path $env:TEMP "SP-WORKBENCH-R6-G0-SOURCE-DISCOVERY-RD2.stdout.txt"
$StdErr = Join-Path $env:TEMP "SP-WORKBENCH-R6-G0-SOURCE-DISCOVERY-RD2.stderr.txt"
$EvidenceDir = "F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-R6-G0-DISCOVERY-EV-RD2"
$Report = Join-Path $EvidenceDir "R6-G0-SOURCE-IDENTITY-DISCOVERY.txt"
$Json = Join-Path $EvidenceDir "R6-G0-SOURCE-IDENTITY-DISCOVERY.json"
$Selected = Join-Path $EvidenceDir "R6-G0-SELECTED-SOURCE.cs"

function Sha([string]$Path) {
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256 -ErrorAction Stop).Hash.ToUpperInvariant()
}

function Show-File([string]$Label,[string]$Path) {
    if (Test-Path -LiteralPath $Path -PathType Leaf) {
        Write-Host ""
        Write-Host ("=== " + $Label + " ===") -ForegroundColor Cyan
        Get-Content -LiteralPath $Path -ErrorAction Stop | ForEach-Object { Write-Host $_ }
    }
}

$SelfTokens = $null
$SelfErrors = $null
[System.Management.Automation.Language.Parser]::ParseFile($PSCommandPath,[ref]$SelfTokens,[ref]$SelfErrors) | Out-Null
if ($null -ne $SelfErrors -and @($SelfErrors).Count -gt 0) {
    $SelfErrors | ForEach-Object {
        Write-Host ("BOOTSTRAP PARSER LINE {0}, COL {1}: {2}" -f $_.Extent.StartLineNumber,$_.Extent.StartColumnNumber,$_.Message) -ForegroundColor Red
    }
    throw "STOP: observability bootstrap parser preflight failed."
}

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)
if ($Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw "STOP: run in normal non-admin PowerShell."
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH R6 G0 RD2 OBSERVABILITY RECOVERY R1" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ("USER       : " + $Identity.Name)
Write-Host ("PINNED RD2 : " + $Expected)
Write-Host ("EVIDENCE   : " + $EvidenceDir)

# First recover any evidence produced by the prior RD2 process. Do not rerun if the
# evidence lane exists because RD2 intentionally requires a fresh lane.
if (Test-Path -LiteralPath $EvidenceDir -PathType Container) {
    Write-Host "PASS: prior RD2 evidence lane exists; recovering it without rerun." -ForegroundColor Green
    Show-File "RD2 REPORT" $Report
    Show-File "RD2 JSON" $Json
    if (Test-Path -LiteralPath $Selected -PathType Leaf) {
        Write-Host ""
        Write-Host ("SELECTED SOURCE : " + $Selected) -ForegroundColor Green
        Write-Host ("SELECTED SHA256 : " + (Sha $Selected)) -ForegroundColor Green
    }
    Write-Host ""
    Write-Host "RECOVERY DISPOSITION: PRIOR_EVIDENCE_RECOVERED"
    exit 0
}

Invoke-WebRequest -UseBasicParsing -Uri $Url -OutFile $Download
$Actual = Sha $Download
if ($Actual -ne $Expected) {
    throw ("STOP: downloaded RD2 hash mismatch. Expected " + $Expected + " Actual " + $Actual)
}
Write-Host "PASS: downloaded exact pinned RD2 bytes." -ForegroundColor Green

# Parse the exact downloaded bytes in the parent process so parser failures cannot
# disappear into a child console.
$Tokens = $null
$Errors = $null
[System.Management.Automation.Language.Parser]::ParseFile($Download,[ref]$Tokens,[ref]$Errors) | Out-Null
if ($null -ne $Errors -and @($Errors).Count -gt 0) {
    Write-Host ""
    Write-Host "=== RD2 PARSER ERRORS ===" -ForegroundColor Red
    $Errors | ForEach-Object {
        Write-Host ("LINE {0}, COL {1}: {2}" -f $_.Extent.StartLineNumber,$_.Extent.StartColumnNumber,$_.Message) -ForegroundColor Red
        Write-Host ("TEXT: " + $_.Extent.Text) -ForegroundColor DarkRed
    }
    throw "STOP: exact pinned RD2 has parser errors. Do not execute."
}
Write-Host "PASS: exact pinned RD2 parser preflight." -ForegroundColor Green

Remove-Item -LiteralPath $StdOut,$StdErr -Force -ErrorAction SilentlyContinue

$Args = @(
    "-NoLogo",
    "-NoProfile",
    "-ExecutionPolicy","Bypass",
    "-File",('"' + $Download + '"')
)

$Child = Start-Process -FilePath "powershell.exe" -ArgumentList $Args -Wait -PassThru -RedirectStandardOutput $StdOut -RedirectStandardError $StdErr

Show-File "RD2 STDOUT" $StdOut
Show-File "RD2 STDERR" $StdErr

Write-Host ""
Write-Host ("RD2 CHILD EXIT CODE: " + $Child.ExitCode)

# If RD2 wrote evidence before failing, recover it now too.
if (Test-Path -LiteralPath $EvidenceDir -PathType Container) {
    Show-File "RD2 REPORT" $Report
    Show-File "RD2 JSON" $Json
    if (Test-Path -LiteralPath $Selected -PathType Leaf) {
        Write-Host ""
        Write-Host ("SELECTED SOURCE : " + $Selected) -ForegroundColor Green
        Write-Host ("SELECTED SHA256 : " + (Sha $Selected)) -ForegroundColor Green
    }
}

if ($Child.ExitCode -ne 0) {
    throw ("STOP: RD2 returned exit code " + $Child.ExitCode + ". Diagnostics are printed above.")
}

Write-Host "PASS: RD2 returned exit code 0." -ForegroundColor Green
