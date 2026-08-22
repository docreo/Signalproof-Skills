$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$Url = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/candidate/workbench-rd2-gui-build/tools/workbench/SP-WORKBENCH-R6-G1-RD1.ps1"
$Expected = "BF605F672910E17BC4116FE4F13A8A68E319508DFB38AFBF073EE4072CA8E30A"
$Temp = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD1.ps1"
$Stage = "F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-R6-G1-RD1.ps1"

function Get-Sha256Upper {
    param([string]$Path)
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256 -ErrorAction Stop).Hash.ToUpperInvariant()
}

function Assert-ParserClean {
    param([string]$Path)
    $Tokens = $null
    $Errors = $null
    [System.Management.Automation.Language.Parser]::ParseFile($Path,[ref]$Tokens,[ref]$Errors) | Out-Null
    if ($null -ne $Errors -and @($Errors).Count -gt 0) {
        $Errors | ForEach-Object { Write-Host ("LINE " + $_.Extent.StartLineNumber + ": " + $_.Message) -ForegroundColor Red }
        throw "STOP: exact-final parser preflight failed."
    }
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH RD2 R6 - G1 RD1" -ForegroundColor Cyan
Write-Host " EXACT DOWNLOAD / HASH / PARSER / BUILD LAUNCHER" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

Invoke-WebRequest -Uri $Url -OutFile $Temp -UseBasicParsing
$Actual = Get-Sha256Upper $Temp
Write-Host ("EXPECTED SHA256 : " + $Expected)
Write-Host ("DOWNLOADED SHA256: " + $Actual)
if ($Actual -ne $Expected) { throw "STOP: downloaded R6-G1 RD1 runner hash mismatch." }

Assert-ParserClean $Temp

if (Test-Path -LiteralPath $Stage -PathType Leaf) {
    $Existing = Get-Sha256Upper $Stage
    if ($Existing -ne $Expected) { throw "STOP: staged G1 RD1 filename already exists with different bytes." }
    Write-Host ("PASS: exact R6-G1 RD1 runner already staged: " + $Stage) -ForegroundColor Green
} else {
    Copy-Item -LiteralPath $Temp -Destination $Stage -ErrorAction Stop
    Write-Host ("PASS: exact R6-G1 RD1 runner staged: " + $Stage) -ForegroundColor Green
}

if ((Get-Sha256Upper $Stage) -ne $Expected) { throw "STOP: staged G1 RD1 runner hash mismatch." }
Assert-ParserClean $Stage
Write-Host "PASS: exact staged G1 RD1 runner hash and parser state verified." -ForegroundColor Green
Unblock-File -LiteralPath $Stage
Write-Host ""
Write-Host "EXECUTING R6-G1 RD1 ONCE..." -ForegroundColor Cyan
Write-Host ""
& $Stage
