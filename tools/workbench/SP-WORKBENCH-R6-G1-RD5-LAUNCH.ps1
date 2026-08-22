$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$SourceUrl = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/candidate/workbench-rd2-r6-build-only/tools/workbench/SP-WORKBENCH-R6-G1-RD4-LAUNCH.ps1"
$TempSource = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD4-LAUNCH-FOR-RD5.ps1"
$TempRd5 = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD5-MATERIALIZED.ps1"

function Get-SignalproofSha256 {
    param([string]$Path)
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256 -ErrorAction Stop).Hash.ToUpperInvariant()
}

function Assert-SignalproofParserClean {
    param([string]$Path)
    $Tokens = $null
    $Errors = $null
    [System.Management.Automation.Language.Parser]::ParseFile($Path,[ref]$Tokens,[ref]$Errors) | Out-Null
    if ($null -ne $Errors -and @($Errors).Count -gt 0) {
        $Errors | ForEach-Object {
            Write-Host ("LINE " + $_.Extent.StartLineNumber + ": " + $_.Message) -ForegroundColor Red
        }
        throw "STOP: exact-final RD5 parser preflight failed."
    }
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH RD2 R6 - G1 RD5" -ForegroundColor Cyan
Write-Host " FRESH-LANE CORRECTION / BUILD-ONLY EXECUTION" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

Invoke-WebRequest -Uri $SourceUrl -OutFile $TempSource -UseBasicParsing
Assert-SignalproofParserClean $TempSource
$SourceSha = Get-SignalproofSha256 $TempSource
Write-Host ("SOURCE RD4 LAUNCHER SHA256 : " + $SourceSha)
Write-Host "PASS: build-only RD4 launcher downloaded and parser-clean." -ForegroundColor Green

$Text = [System.IO.File]::ReadAllText($TempSource,[System.Text.Encoding]::UTF8)
$Text = $Text.Replace("R6-G1-RD4","R6-G1-RD5")
$Text = $Text.Replace("R6 G1 RD4","R6 G1 RD5")
$Text = $Text.Replace("G1 RD4","G1 RD5")
$Text = $Text.Replace("RD1/RD2/RD3 candidate lanes preserved; RD4 uses a fresh candidate lane.","RD1/RD2/RD3/RD4 candidate lanes preserved; RD5 uses a fresh candidate lane.")
$Text = $Text.Replace("RD1/RD2/RD3 lanes as immutable evidence","RD1/RD2/RD3/RD4 lanes as immutable evidence")
$Text = $Text.Replace("stale viewer-subtitle assertion survived RD4 patch","stale viewer-subtitle assertion survived RD5 patch")
$Text = $Text.Replace("fresh RD4 candidate lane patch missing","fresh RD5 candidate lane patch missing")
$Text = $Text.Replace("floating badge implementation present in RD4 builder","floating badge implementation present in RD5 builder")
$Text = $Text.Replace("conflicting H alias remains in RD4 execution scope","conflicting H alias remains in RD5 execution scope")
$Text = $Text.Replace("conflicting H alias absent in RD4 build execution scope","conflicting H alias absent in RD5 build execution scope")

if ($Text.IndexOf("Signalproof-Workbench-GUI-RD2-R6-G1-RD5",[System.StringComparison]::Ordinal) -lt 0) {
    throw "STOP: RD5 fresh candidate directory not materialized."
}
if ($Text.IndexOf("SP-WORKBENCH-R6-G1-RD5.ps1",[System.StringComparison]::Ordinal) -lt 0) {
    throw "STOP: RD5 staged builder path not materialized."
}
if ($Text.IndexOf("Signalproof-Workbench-GUI-RD2-R6-G1-RD4",[System.StringComparison]::Ordinal) -ge 0) {
    throw "STOP: stale RD4 candidate directory survived RD5 materialization."
}

[System.IO.File]::WriteAllText($TempRd5,$Text,(New-Object System.Text.UTF8Encoding($false)))
Assert-SignalproofParserClean $TempRd5
$Rd5Sha = Get-SignalproofSha256 $TempRd5
Write-Host ("MATERIALIZED RD5 LAUNCHER SHA256: " + $Rd5Sha)
Write-Host "PASS: RD5 launcher parser-clean." -ForegroundColor Green
Write-Host "PASS: RD5 uses a fresh fixed candidate/evidence lane." -ForegroundColor Green
Write-Host "PASS: RD4 evidence remains untouched." -ForegroundColor Green
Write-Host ""
Write-Host "EXECUTING R6-G1 RD5 ONCE..." -ForegroundColor Cyan
Write-Host ""
& $TempRd5
