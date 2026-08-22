$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$Url = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/refs/heads/candidate/workbench-rd2-gui-build/tools/workbench/SP-WORKBENCH-R6-G0-SOURCE-DISCOVERY-RD2.ps1"
$Expected = "9AE22F26C9BDFCC868812E2B0746F70578D52FD748FD4A5B4A4F9710093C7684"
$Download = Join-Path $env:TEMP "SP-WORKBENCH-R6-G0-SOURCE-DISCOVERY-RD2.ps1"

function Sha([string]$Path) {
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256 -ErrorAction Stop).Hash.ToUpperInvariant()
}

$Tokens=$null
$Errors=$null
[System.Management.Automation.Language.Parser]::ParseFile($PSCommandPath,[ref]$Tokens,[ref]$Errors) | Out-Null
if ($null -ne $Errors -and @($Errors).Count -gt 0) {
    throw "STOP: bootstrap parser preflight failed."
}

$Identity=[Security.Principal.WindowsIdentity]::GetCurrent()
$Principal=New-Object Security.Principal.WindowsPrincipal($Identity)
if ($Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    throw "STOP: run this bootstrap in normal non-admin PowerShell."
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH R6 G0 SOURCE DISCOVERY RD2 BOOTSTRAP" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ("USER       : " + $Identity.Name)
Write-Host ("SOURCE URL : " + $Url)
Write-Host ("PINNED SHA : " + $Expected)

Invoke-WebRequest -UseBasicParsing -Uri $Url -OutFile $Download
$Actual=Sha $Download
if ($Actual -ne $Expected) {
    throw ("STOP: downloaded RD2 hash mismatch. Expected " + $Expected + " Actual " + $Actual)
}
Write-Host "PASS: downloaded RD2 runner exact SHA256" -ForegroundColor Green

$Child = Start-Process -FilePath "powershell.exe" -ArgumentList @(
    "-NoLogo",
    "-NoProfile",
    "-ExecutionPolicy","Bypass",
    "-File",$Download
) -Wait -PassThru

if ($Child.ExitCode -ne 0) {
    throw ("STOP: RD2 runner returned exit code " + $Child.ExitCode)
}
Write-Host "PASS: RD2 source identity discriminator returned exit code 0" -ForegroundColor Green
