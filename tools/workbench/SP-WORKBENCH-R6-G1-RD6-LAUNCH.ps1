$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$SourceUrl = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/candidate/workbench-rd2-r6-build-only/tools/workbench/SP-WORKBENCH-R6-G1-RD4-LAUNCH.ps1"
$TempSource = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD4-LAUNCH-FOR-RD6.ps1"
$TempRd6 = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD6-MATERIALIZED.ps1"

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
        throw "STOP: exact-final RD6 parser preflight failed."
    }
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH RD2 R6 - G1 RD6" -ForegroundColor Cyan
Write-Host " HASH-HELPER NAMESPACE CORRECTION / BUILD-ONLY EXECUTION" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

Invoke-WebRequest -Uri $SourceUrl -OutFile $TempSource -UseBasicParsing
Assert-SignalproofParserClean $TempSource
$SourceSha = Get-SignalproofSha256 $TempSource
Write-Host ("SOURCE RD4 LAUNCHER SHA256 : " + $SourceSha)
Write-Host "PASS: build-only RD4 launcher downloaded and parser-clean." -ForegroundColor Green

$Text = [System.IO.File]::ReadAllText($TempSource,[System.Text.Encoding]::UTF8)

# Fresh attempt identity while preserving all prior lanes.
$Text = $Text.Replace("R6-G1-RD4","R6-G1-RD6")
$Text = $Text.Replace("R6 G1 RD4","R6 G1 RD6")
$Text = $Text.Replace("G1 RD4","G1 RD6")
$Text = $Text.Replace("RD1/RD2/RD3 candidate lanes preserved; RD4 uses a fresh candidate lane.","RD1/RD2/RD3/RD4/RD5 candidate lanes preserved; RD6 uses a fresh candidate lane.")
$Text = $Text.Replace("RD1/RD2/RD3 lanes as immutable evidence","RD1/RD2/RD3/RD4/RD5 lanes as immutable evidence")
$Text = $Text.Replace("stale viewer-subtitle assertion survived RD4 patch","stale viewer-subtitle assertion survived RD6 patch")
$Text = $Text.Replace("fresh RD4 candidate lane patch missing","fresh RD6 candidate lane patch missing")
$Text = $Text.Replace("floating badge implementation present in RD4 builder","floating badge implementation present in RD6 builder")

# Remove the disproven alias-suppression mitigation entirely.
$AliasBlock = @'
$AliasH = Get-Alias -Name H -ErrorAction SilentlyContinue
if ($null -ne $AliasH) {
    Write-Host ("FOUND CONFLICTING ALIAS H -> " + $AliasH.Definition) -ForegroundColor Yellow
    Remove-Item Alias:H -Force -ErrorAction Stop
}
if ($null -ne (Get-Alias -Name H -ErrorAction SilentlyContinue)) { throw "STOP: conflicting H alias remains in RD6 execution scope." }
Write-Host "PASS: conflicting H alias absent in RD6 build execution scope." -ForegroundColor Green
'@
if ($Text.IndexOf($AliasBlock,[System.StringComparison]::Ordinal) -lt 0) {
    throw "STOP: expected inherited alias-suppression block not localized for removal."
}
$Text = $Text.Replace($AliasBlock,'Write-Host "PASS: alias suppression retired; builder helper will be renamed before execution." -ForegroundColor Green' + [Environment]::NewLine)

# After the exact base builder is read, rename the helper and every H $... invocation.
$ReadAnchor = '$Text = [System.IO.File]::ReadAllText($TempBase,[System.Text.Encoding]::UTF8)'
$RenamePatch = @'
$Text = [System.IO.File]::ReadAllText($TempBase,[System.Text.Encoding]::UTF8)
$Text = $Text.Replace('function H($p)','function Get-SignalproofFileSha256($p)')
$Text = [regex]::Replace($Text,'(?<![A-Za-z0-9_-])H\s+(?=\$)','Get-SignalproofFileSha256 ')
if ($Text.IndexOf('function H(',[System.StringComparison]::Ordinal) -ge 0) { throw "STOP: legacy H helper definition survived RD6 rename." }
if ([regex]::IsMatch($Text,'(?<![A-Za-z0-9_-])H\s+(?=\$)')) { throw "STOP: legacy H helper invocation survived RD6 rename." }
if ($Text.IndexOf('function Get-SignalproofFileSha256($p)',[System.StringComparison]::Ordinal) -lt 0) { throw "STOP: collision-resistant SHA helper missing after RD6 rename." }
Write-Host "PASS: base builder SHA helper renamed to Get-SignalproofFileSha256 before materialization." -ForegroundColor Green
'@
if ($Text.IndexOf($ReadAnchor,[System.StringComparison]::Ordinal) -lt 0) {
    throw "STOP: base-builder read anchor not localized for RD6 helper rename."
}
$Text = $Text.Replace($ReadAnchor,$RenamePatch.TrimEnd("`r","`n"))

if ($Text.IndexOf("Signalproof-Workbench-GUI-RD2-R6-G1-RD6",[System.StringComparison]::Ordinal) -lt 0) { throw "STOP: RD6 fresh candidate directory not materialized." }
if ($Text.IndexOf("SP-WORKBENCH-R6-G1-RD6.ps1",[System.StringComparison]::Ordinal) -lt 0) { throw "STOP: RD6 staged builder path not materialized." }
if ($Text.IndexOf("Signalproof-Workbench-GUI-RD2-R6-G1-RD4",[System.StringComparison]::Ordinal) -ge 0) { throw "STOP: stale RD4 candidate directory survived RD6 materialization." }
if ($Text.IndexOf("Remove-Item Alias:H",[System.StringComparison]::Ordinal) -ge 0) { throw "STOP: disproven alias-removal mitigation survived RD6 materialization." }
if ($Text.IndexOf("Get-SignalproofFileSha256",[System.StringComparison]::Ordinal) -lt 0) { throw "STOP: SHA helper rename patch missing from RD6 launcher." }

[System.IO.File]::WriteAllText($TempRd6,$Text,(New-Object System.Text.UTF8Encoding($false)))
Assert-SignalproofParserClean $TempRd6
$Rd6Sha = Get-SignalproofSha256 $TempRd6
Write-Host ("MATERIALIZED RD6 LAUNCHER SHA256: " + $Rd6Sha)
Write-Host "PASS: RD6 launcher parser-clean." -ForegroundColor Green
Write-Host "PASS: RD6 uses a fresh fixed candidate/evidence lane." -ForegroundColor Green
Write-Host "PASS: RD1-RD5 evidence remains untouched." -ForegroundColor Green
Write-Host "PASS: alias-removal mitigation absent; collision-resistant helper rename installed." -ForegroundColor Green
Write-Host ""
Write-Host "EXECUTING R6-G1 RD6 ONCE..." -ForegroundColor Cyan
Write-Host ""
& $TempRd6
