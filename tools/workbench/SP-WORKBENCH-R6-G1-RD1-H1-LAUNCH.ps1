$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$Url = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/candidate/workbench-rd2-gui-build/tools/workbench/SP-WORKBENCH-R6-G1-RD1.ps1"
$Expected = "BF605F672910E17BC4116FE4F13A8A68E319508DFB38AFBF073EE4072CA8E30A"
$Temp = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD1-H1-RUNNER.ps1"
$Stage = "F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-R6-G1-RD1.ps1"

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
        throw "STOP: exact-final G1 RD1 parser preflight failed."
    }
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH RD2 R6 - G1 RD1 H1" -ForegroundColor Cyan
Write-Host " POWERSHELL ALIAS-COLLISION HARNESS CORRECTION" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

Invoke-WebRequest -Uri $Url -OutFile $Temp -UseBasicParsing
$Actual = Get-SignalproofSha256 $Temp
Write-Host ("EXPECTED G1 BUILDER SHA256 : " + $Expected)
Write-Host ("DOWNLOADED BUILDER SHA256  : " + $Actual)
if ($Actual -ne $Expected) {
    throw "STOP: downloaded G1 RD1 builder hash mismatch."
}

Assert-SignalproofParserClean $Temp

if (Test-Path -LiteralPath $Stage -PathType Leaf) {
    $Existing = Get-SignalproofSha256 $Stage
    if ($Existing -ne $Expected) {
        throw "STOP: staged G1 RD1 filename exists with different bytes."
    }
    Write-Host ("PASS: exact G1 RD1 builder already staged: " + $Stage) -ForegroundColor Green
} else {
    Copy-Item -LiteralPath $Temp -Destination $Stage -ErrorAction Stop
    Write-Host ("PASS: exact G1 RD1 builder staged: " + $Stage) -ForegroundColor Green
}

if ((Get-SignalproofSha256 $Stage) -ne $Expected) {
    throw "STOP: staged G1 RD1 builder hash mismatch."
}
Assert-SignalproofParserClean $Stage
Write-Host "PASS: exact staged G1 RD1 builder hash and parser state verified." -ForegroundColor Green

# Windows PowerShell defines H as an alias for Get-History. Alias resolution
# precedes function resolution, so the RD1 helper named H was never reached.
# Remove only the conflicting alias in this disposable NoProfile process.
$AliasH = Get-Item Alias:H -ErrorAction SilentlyContinue
if ($null -ne $AliasH) {
    Write-Host ("FOUND CONFLICTING ALIAS H -> " + $AliasH.Definition) -ForegroundColor Yellow
    Remove-Item Alias:H -Force -ErrorAction Stop
}
if ($null -ne (Get-Item Alias:H -ErrorAction SilentlyContinue)) {
    throw "STOP: conflicting H alias still present after scoped correction."
}
Write-Host "PASS: conflicting H alias absent in build execution scope." -ForegroundColor Green

Unblock-File -LiteralPath $Stage

Write-Host ""
Write-Host "EXECUTING EXACT G1 RD1 BUILDER WITH H1 HARNESS CORRECTION..." -ForegroundColor Cyan
Write-Host ""

& $Stage
