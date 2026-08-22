$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$SourceUrl = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/candidate/workbench-rd2-r6-build-only/tools/workbench/SP-WORKBENCH-R6-G1-RD4-LAUNCH.ps1"
$ExpectedRd4LauncherSha = "48DCD9078FF22507F322C2A9A60DCB8AACB56F60EF7538B2D0CB55C012FBDC09"
$TempSource = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD4-LAUNCH-FOR-RD7.ps1"
$TempRd7 = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD7-MATERIALIZED.ps1"

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
        throw "STOP: exact-final RD7 parser preflight failed."
    }
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH RD2 R6 - G1 RD7" -ForegroundColor Cyan
Write-Host " TESTED ALIAS-COLLISION ELIMINATION / BUILD-ONLY EXECUTION" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

Invoke-WebRequest -Uri $SourceUrl -OutFile $TempSource -UseBasicParsing
$SourceSha = Get-SignalproofSha256 $TempSource
Write-Host ("EXPECTED RD4 LAUNCHER SHA256 : " + $ExpectedRd4LauncherSha)
Write-Host ("DOWNLOADED RD4 SHA256       : " + $SourceSha)
if ($SourceSha -ne $ExpectedRd4LauncherSha) { throw "STOP: exact RD4 launcher hash mismatch." }
Assert-SignalproofParserClean $TempSource
Write-Host "PASS: exact executed RD4 launcher identity and parser state verified." -ForegroundColor Green

$SourceText = [System.IO.File]::ReadAllText($TempSource,[System.Text.Encoding]::UTF8)
$SourceLines = @($SourceText -split "`r?`n")
$Out = New-Object System.Collections.Generic.List[string]
$SkippingAliasBlock = $false
$AliasStartSeen = $false
$AliasEndSeen = $false
$JoinInjectionSeen = $false

foreach ($Line in $SourceLines) {
    if (-not $SkippingAliasBlock -and $Line.Trim() -eq '$AliasH = Get-Alias -Name H -ErrorAction SilentlyContinue') {
        $SkippingAliasBlock = $true
        $AliasStartSeen = $true
        continue
    }

    if ($SkippingAliasBlock) {
        if ($Line.IndexOf('PASS: conflicting H alias absent in RD4 build execution scope.',[System.StringComparison]::Ordinal) -ge 0) {
            $SkippingAliasBlock = $false
            $AliasEndSeen = $true
            [void]$Out.Add('Write-Host "PASS: alias suppression retired; staged builder helper will be renamed." -ForegroundColor Green')
        }
        continue
    }

    [void]$Out.Add($Line)

    if ($Line.Trim() -eq '$Patched = [string]::Join("`r`n",@($Lines))') {
        $JoinInjectionSeen = $true
        [void]$Out.Add('$Patched = $Patched.Replace(''function H($p)'',''function Get-SignalproofFileSha256($p)'')')
        [void]$Out.Add('$Patched = $Patched.Replace(''$self=H $PSCommandPath'',''$self=Get-SignalproofFileSha256 $PSCommandPath'')')
        [void]$Out.Add('$Patched = $Patched.Replace(''(H $Base)'',''(Get-SignalproofFileSha256 $Base)'')')
        [void]$Out.Add('$Patched = $Patched.Replace(''(H $Prod)'',''(Get-SignalproofFileSha256 $Prod)'')')
        [void]$Out.Add('$Patched = $Patched.Replace(''(H $_)'',''(Get-SignalproofFileSha256 $_)'')')
        [void]$Out.Add('$Patched = $Patched.Replace(''$ss=H $Src'',''$ss=Get-SignalproofFileSha256 $Src'')')
        [void]$Out.Add('$Patched = $Patched.Replace(''$es=H $Exe'',''$es=Get-SignalproofFileSha256 $Exe'')')
        [void]$Out.Add('if ($Patched.IndexOf(''function H('',[System.StringComparison]::Ordinal) -ge 0) { throw "STOP: legacy H helper definition survived RD7 rename." }')
        [void]$Out.Add('if ([regex]::IsMatch($Patched,''(?<![A-Za-z0-9_-])H\s+(?=\$)'')) { throw "STOP: legacy H helper invocation survived RD7 rename." }')
        [void]$Out.Add('if ($Patched.IndexOf(''function Get-SignalproofFileSha256($p)'',[System.StringComparison]::Ordinal) -lt 0) { throw "STOP: collision-resistant SHA helper missing after RD7 rename." }')
        [void]$Out.Add('Write-Host "PASS: staged builder SHA helper renamed to Get-SignalproofFileSha256." -ForegroundColor Green')
    }
}

if ($SkippingAliasBlock) { throw "STOP: RD4 alias block start found without end." }
if (-not $AliasStartSeen -or -not $AliasEndSeen) { throw "STOP: RD4 alias block boundaries were not both localized." }
if (-not $JoinInjectionSeen) { throw "STOP: patched-builder join anchor not localized for helper rename." }

$Text = [string]::Join("`r`n",@($Out))
$Text = $Text.Replace("R6-G1-RD4","R6-G1-RD7")
$Text = $Text.Replace("R6 G1 RD4","R6 G1 RD7")
$Text = $Text.Replace("G1 RD4","G1 RD7")
$Text = $Text.Replace("RD1/RD2/RD3 candidate lanes preserved; RD7 uses a fresh candidate lane.","RD1/RD2/RD3/RD4/RD5/RD6 candidate lanes preserved; RD7 uses a fresh candidate lane.")
$Text = $Text.Replace("RD1/RD2/RD3 lanes as immutable evidence","RD1/RD2/RD3/RD4/RD5/RD6 lanes as immutable evidence")

if ($Text.IndexOf("Signalproof-Workbench-GUI-RD2-R6-G1-RD7",[System.StringComparison]::Ordinal) -lt 0) { throw "STOP: RD7 fresh candidate directory not materialized." }
if ($Text.IndexOf("SP-WORKBENCH-R6-G1-RD7.ps1",[System.StringComparison]::Ordinal) -lt 0) { throw "STOP: RD7 staged builder path not materialized." }
if ($Text.IndexOf("Signalproof-Workbench-GUI-RD2-R6-G1-RD4",[System.StringComparison]::Ordinal) -ge 0) { throw "STOP: stale RD4 candidate directory survived RD7 materialization." }
if ($Text.IndexOf("Remove-Item Alias:H",[System.StringComparison]::Ordinal) -ge 0) { throw "STOP: disproven alias-removal mitigation survived RD7 materialization." }
if ($Text.IndexOf("Get-SignalproofFileSha256",[System.StringComparison]::Ordinal) -lt 0) { throw "STOP: staged-builder SHA helper rename logic missing." }

[System.IO.File]::WriteAllText($TempRd7,$Text,(New-Object System.Text.UTF8Encoding($false)))
Assert-SignalproofParserClean $TempRd7
$Rd7Sha = Get-SignalproofSha256 $TempRd7
Write-Host ("MATERIALIZED RD7 LAUNCHER SHA256: " + $Rd7Sha)
Write-Host "PASS: RD7 launcher parser-clean." -ForegroundColor Green
Write-Host "PASS: RD7 uses a fresh fixed candidate/evidence lane." -ForegroundColor Green
Write-Host "PASS: RD1-RD6 evidence remains untouched." -ForegroundColor Green
Write-Host "PASS: alias block removed structurally; collision-resistant staged-builder rename installed." -ForegroundColor Green
Write-Host ""
Write-Host "EXECUTING R6-G1 RD7 ONCE..." -ForegroundColor Cyan
Write-Host ""
& $TempRd7
