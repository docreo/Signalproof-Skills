$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$BaseUrl = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/candidate/workbench-rd2-r6-build-only/tools/workbench/SP-WORKBENCH-R6-G1-RD1.ps1"
$ExpectedBaseSha = "BF605F672910E17BC4116FE4F13A8A68E319508DFB38AFBF073EE4072CA8E30A"
$TempBase = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD1-BASE-FOR-RD4.ps1"
$Stage = "F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-R6-G1-RD4.ps1"

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
        throw "STOP: exact-final parser preflight failed."
    }
}

function Write-SignalproofUtf8NoBom {
    param([string]$Path,[string]$Text)
    [System.IO.File]::WriteAllText($Path,$Text,(New-Object System.Text.UTF8Encoding($false)))
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH RD2 R6 - G1 RD4" -ForegroundColor Cyan
Write-Host " SELF-TEST CONTRACT + NON-OVERLAY VERSION IDENTITY CORRECTION" -ForegroundColor Cyan
Write-Host " BUILD-ONLY EXECUTION LANE" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

Invoke-WebRequest -Uri $BaseUrl -OutFile $TempBase -UseBasicParsing
$BaseActual = Get-SignalproofSha256 $TempBase
Write-Host ("EXPECTED BASE BUILDER SHA256 : " + $ExpectedBaseSha)
Write-Host ("DOWNLOADED BASE SHA256       : " + $BaseActual)
if ($BaseActual -ne $ExpectedBaseSha) { throw "STOP: base G1 RD1 builder hash mismatch." }
Assert-SignalproofParserClean $TempBase
Write-Host "PASS: exact G1 RD1 base builder identity and parser state verified." -ForegroundColor Green

$Text = [System.IO.File]::ReadAllText($TempBase,[System.Text.Encoding]::UTF8)

# Fresh candidate lane; preserve RD1/RD2/RD3 lanes as immutable evidence.
$Text = $Text.Replace("Signalproof-Workbench-GUI-RD2-R6-G1-RD1","Signalproof-Workbench-GUI-RD2-R6-G1-RD4")
$Text = $Text.Replace("Signalproof-Workbench-RD2-R6-G1-RD1.exe","Signalproof-Workbench-RD2-R6-G1-RD4.exe")
$Text = $Text.Replace("WORKBENCH RD2 R6 G1 RD1","WORKBENCH RD2 R6 G1 RD4")
$Text = $Text.Replace("Workbench RD2 R6 G1 RD1","Workbench RD2 R6 G1 RD4")

$Lines = New-Object System.Collections.Generic.List[string]
foreach ($Line in ($Text -split "`r?`n")) {
    if ($Line.IndexOf("viewer subtitle localized",[System.StringComparison]::OrdinalIgnoreCase) -ge 0) {
        [void]$Lines.Add('P ($s.Contains(''"Signalproof Workbench"'')) "viewer identity string localized"')
        continue
    }

    if ($Line.IndexOf('$sd=M $s "SendCurrentPrompt"',[System.StringComparison]::Ordinal) -ge 0) {
        [void]$Lines.Add('$sd=M $s "SendCurrentPrompt";P ($null-ne$sd) "send method localized";$x=$sd.x;$o=$x.IndexOf("{");$sendInsert=([Environment]::NewLine + ''            spAllowAutoFollow=true; this.Text="Signalproof Workbench - RD2 R6-G1 Candidate";'');$x=$x.Insert($o+1,$sendInsert);$s=$s.Substring(0,$sd.i)+$x+$s.Substring($sd.i+$sd.l)')
        continue
    }

    if ($Line.IndexOf('$bs=M $s "BuildShell"',[System.StringComparison]::Ordinal) -ge 0) {
        [void]$Lines.Add('$bs=M $s "BuildShell";P ($null-ne$bs) "BuildShell localized for non-overlay candidate identity";$x=$bs.x;$z=$x.LastIndexOf("}");$titleInsert=([Environment]::NewLine + ''            this.Text="Signalproof Workbench - RD2 R6-G1 Candidate";'' + [Environment]::NewLine);$x=$x.Insert($z,$titleInsert);$s=$s.Substring(0,$bs.i)+$x+$s.Substring($bs.i+$bs.l)')
        continue
    }

    if ($Line.IndexOf('W $Src $s;$ss=H $Src;', [System.StringComparison]::Ordinal) -ge 0) {
        [void]$Lines.Add($Line)
        [void]$Lines.Add('$generated=[IO.File]::ReadAllText($Src,[Text.Encoding]::UTF8);P ($generated.IndexOf(([char]96).ToString()+"r"+([char]96).ToString()+"n",[System.StringComparison]::Ordinal)-lt0) "generated C# contains no literal PowerShell CRLF escape tokens";P ($generated.IndexOf("RD2 R6-G1 CANDIDATE",[System.StringComparison]::Ordinal)-lt0) "generated C# contains no floating candidate badge"')
        continue
    }

    if ($Line.IndexOf('$r=Native $Exe @("--self-test=$ST")', [System.StringComparison]::Ordinal) -ge 0) {
        $Corrected = $Line.Replace('@("--self-test=$ST")','@("--self-test",$ST)')
        [void]$Lines.Add($Corrected)
        continue
    }

    [void]$Lines.Add($Line)
}

$Patched = [string]::Join("`r`n",@($Lines))

if ($Patched.IndexOf("viewer subtitle localized",[System.StringComparison]::OrdinalIgnoreCase) -ge 0) { throw "STOP: stale viewer-subtitle assertion survived RD4 patch." }
if ($Patched.IndexOf("Signalproof-Workbench-GUI-RD2-R6-G1-RD4",[System.StringComparison]::Ordinal) -lt 0) { throw "STOP: fresh RD4 candidate lane patch missing." }
if ($Patched.IndexOf('$sendInsert=([Environment]::NewLine', [System.StringComparison]::Ordinal) -lt 0) { throw "STOP: safe send newline patch missing." }
if ($Patched.IndexOf('$titleInsert=([Environment]::NewLine', [System.StringComparison]::Ordinal) -lt 0) { throw "STOP: safe non-overlay title patch missing." }
if ($Patched.IndexOf('@("--self-test",$ST)', [System.StringComparison]::Ordinal) -lt 0) { throw "STOP: historical two-argument self-test contract missing." }
if ($Patched.IndexOf('@("--self-test=$ST")', [System.StringComparison]::Ordinal) -ge 0) { throw "STOP: stale combined self-test argument survived RD4 patch." }
if ($Patched.IndexOf('spBuildBadge', [System.StringComparison]::Ordinal) -ge 0) { throw "STOP: floating badge implementation present in RD4 builder." }

Write-SignalproofUtf8NoBom $Stage $Patched
Assert-SignalproofParserClean $Stage
$PatchedSha = Get-SignalproofSha256 $Stage
Write-Host ("PATCHED RD4 BUILDER SHA256     : " + $PatchedSha)
Write-Host "PASS: exact-final patched RD4 builder parser state verified." -ForegroundColor Green
Write-Host "PASS: RD1/RD2/RD3 candidate lanes preserved; RD4 uses a fresh candidate lane." -ForegroundColor Green
Write-Host "PASS: historical two-argument Workbench self-test contract installed." -ForegroundColor Green
Write-Host "PASS: floating candidate badge removed; version identity remains in window title." -ForegroundColor Green
Write-Host "PASS: generated-source newline construction remains Environment.NewLine based." -ForegroundColor Green

$AliasH = Get-Alias -Name H -ErrorAction SilentlyContinue
if ($null -ne $AliasH) {
    Write-Host ("FOUND CONFLICTING ALIAS H -> " + $AliasH.Definition) -ForegroundColor Yellow
    Remove-Item Alias:H -Force -ErrorAction Stop
}
if ($null -ne (Get-Alias -Name H -ErrorAction SilentlyContinue)) { throw "STOP: conflicting H alias remains in RD4 execution scope." }
Write-Host "PASS: conflicting H alias absent in RD4 build execution scope." -ForegroundColor Green

Write-Host ""
Write-Host "EXECUTING MATERIAL-CORRECTION R6-G1 RD4 BUILDER ONCE..." -ForegroundColor Cyan
Write-Host ""
& $Stage
