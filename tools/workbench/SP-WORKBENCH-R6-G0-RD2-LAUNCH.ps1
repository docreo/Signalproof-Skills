$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$Url = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/candidate/workbench-rd2-gui-build/tools/workbench/SP-WORKBENCH-R6-G0-RD2.ps1"
$Expected = "5A3941F2E1C57570E4E2589645F646F18027DCF29656E7F314BCFDC52487A821"
$Temp = Join-Path $env:TEMP "SP-WORKBENCH-R6-G0-RD2.ps1"
$Stage = "F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-R6-G0-RD2.ps1"

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
Write-Host " SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD2" -ForegroundColor Cyan
Write-Host " EXACT DOWNLOAD / HASH / PARSER / EXECUTION LAUNCHER" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

Invoke-WebRequest -Uri $Url -OutFile $Temp -UseBasicParsing
$Actual = Get-Sha256Upper $Temp
Write-Host ("EXPECTED SHA256 : " + $Expected)
Write-Host ("DOWNLOADED SHA256: " + $Actual)
if ($Actual -ne $Expected) { throw "STOP: downloaded R6-G0 RD2 runner hash mismatch." }

Assert-ParserClean $Temp

if (Test-Path -LiteralPath $Stage -PathType Leaf) {
    $Existing = Get-Sha256Upper $Stage
    if ($Existing -ne $Expected) { throw "STOP: staged RD2 filename already exists with different bytes." }
    Write-Host ("PASS: exact R6-G0 RD2 runner already staged: " + $Stage) -ForegroundColor Green
} else {
    Copy-Item -LiteralPath $Temp -Destination $Stage -ErrorAction Stop
    Write-Host ("PASS: exact R6-G0 RD2 runner staged: " + $Stage) -ForegroundColor Green
}

if ((Get-Sha256Upper $Stage) -ne $Expected) { throw "STOP: staged RD2 runner hash mismatch." }
Assert-ParserClean $Stage
Write-Host "PASS: exact staged RD2 runner hash and parser state verified." -ForegroundColor Green
Unblock-File -LiteralPath $Stage
Write-Host ""
Write-Host "EXECUTING R6-G0 RD2 ONCE..." -ForegroundColor Cyan
Write-Host ""
& $Stage
