$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$Url = "https://raw.githubusercontent.com/docreo/Signalproof-Skills/candidate/workbench-rd2-gui-build/tools/workbench/SP-WORKBENCH-R6-G1-RD1.ps1"
$ExpectedBaseSha = "BF605F672910E17BC4116FE4F13A8A68E319508DFB38AFBF073EE4072CA8E30A"
$TempBase = Join-Path $env:TEMP "SP-WORKBENCH-R6-G1-RD1-BASE.ps1"
$Stage = "F:\Downloads\Quarantine\Evidence\SP-WORKBENCH-R6-G1-RD2.ps1"

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
Write-Host " SIGNALPROOF WORKBENCH RD2 R6 - G1 RD2" -ForegroundColor Cyan
Write-Host " FRESH CANDIDATE / ACTUAL BUILDSHELL VERSION BADGE CORRECTION" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

Invoke-WebRequest -Uri $Url -OutFile $TempBase -UseBasicParsing
$BaseActual = Get-SignalproofSha256 $TempBase
Write-Host ("EXPECTED BASE BUILDER SHA256 : " + $ExpectedBaseSha)
Write-Host ("DOWNLOADED BASE SHA256       : " + $BaseActual)
if ($BaseActual -ne $ExpectedBaseSha) {
    throw "STOP: base G1 RD1 builder hash mismatch."
}
Assert-SignalproofParserClean $TempBase
Write-Host "PASS: exact G1 RD1 base builder identity and parser state verified." -ForegroundColor Green

$Text = [System.IO.File]::ReadAllText($TempBase,[System.Text.Encoding]::UTF8)

# Fresh candidate lane: preserve the partially prepared RD1 directory as failure evidence.
$Text = $Text.Replace("Signalproof-Workbench-GUI-RD2-R6-G1-RD1","Signalproof-Workbench-GUI-RD2-R6-G1-RD2")
$Text = $Text.Replace("Signalproof-Workbench-RD2-R6-G1-RD1.exe","Signalproof-Workbench-RD2-R6-G1-RD2.exe")
$Text = $Text.Replace("WORKBENCH RD2 R6 G1 RD1","WORKBENCH RD2 R6 G1 RD2")
$Text = $Text.Replace("Workbench RD2 R6 G1 RD1","Workbench RD2 R6 G1 RD2")

$Lines = New-Object System.Collections.Generic.List[string]
foreach ($Line in ($Text -split "`r?`n")) {
    if ($Line.IndexOf("viewer subtitle localized",[System.StringComparison]::OrdinalIgnoreCase) -ge 0) {
        [void]$Lines.Add('P ($s.Contains(''"Signalproof Workbench"'')) "viewer identity string localized"')
        continue
    }

    if ($Line.IndexOf('$bs=M $s "BuildShell"',[System.StringComparison]::Ordinal) -ge 0) {
        [void]$Lines.Add('$bs=M $s "BuildShell";P ($null-ne$bs) "BuildShell localized for visible candidate identity";$x=$bs.x;$z=$x.LastIndexOf("}");$badge=''`r`n            this.Text="Signalproof Workbench - RD2 R6-G1 Candidate";`r`n            Label spBuildBadge=MakeLabel("RD2 R6-G1 CANDIDATE",9f,FontStyle.Bold,Color.White);`r`n            spBuildBadge.BackColor=Color.FromArgb(176,22,30);spBuildBadge.AutoSize=true;spBuildBadge.Padding=new Padding(8,4,8,4);spBuildBadge.Anchor=AnchorStyles.Top|AnchorStyles.Right;spBuildBadge.Location=new Point(Math.Max(8,this.ClientSize.Width-spBuildBadge.PreferredWidth-18),8);this.Controls.Add(spBuildBadge);spBuildBadge.BringToFront();`r`n'';$x=$x.Insert($z,$badge);$s=$s.Substring(0,$bs.i)+$x+$s.Substring($bs.i+$bs.l)')
        continue
    }

    [void]$Lines.Add($Line)
}

$Patched = [string]::Join("`r`n",@($Lines))

if ($Patched.IndexOf("viewer subtitle localized",[System.StringComparison]::OrdinalIgnoreCase) -ge 0) {
    throw "STOP: stale viewer-subtitle assertion survived RD2 patch."
}
if ($Patched.IndexOf("RD2 R6-G1 CANDIDATE",[System.StringComparison]::Ordinal) -lt 0) {
    throw "STOP: visible RD2 candidate badge patch missing."
}
if ($Patched.IndexOf("Signalproof-Workbench-GUI-RD2-R6-G1-RD2",[System.StringComparison]::Ordinal) -lt 0) {
    throw "STOP: fresh RD2 candidate lane patch missing."
}

Write-SignalproofUtf8NoBom $Stage $Patched
Assert-SignalproofParserClean $Stage
$PatchedSha = Get-SignalproofSha256 $Stage
Write-Host ("PATCHED RD2 BUILDER SHA256     : " + $PatchedSha)
Write-Host "PASS: exact-final patched RD2 builder parser state verified." -ForegroundColor Green
Write-Host "PASS: RD1 partial candidate preserved; RD2 uses a fresh candidate lane." -ForegroundColor Green
Write-Host "PASS: nonexistent subtitle literal removed as a patch dependency." -ForegroundColor Green
Write-Host "PASS: visible high-contrast RD2 R6-G1 candidate badge bound to BuildShell." -ForegroundColor Green

# Prevent the already-classified H -> Get-History command-resolution collision
# inside this disposable NoProfile child process only.
$AliasH = Get-Alias -Name H -ErrorAction SilentlyContinue
if ($null -ne $AliasH) {
    Write-Host ("FOUND CONFLICTING ALIAS H -> " + $AliasH.Definition) -ForegroundColor Yellow
    Remove-Item Alias:H -Force -ErrorAction Stop
}
if ($null -ne (Get-Alias -Name H -ErrorAction SilentlyContinue)) {
    throw "STOP: conflicting H alias remains in RD2 execution scope."
}
Write-Host "PASS: conflicting H alias absent in RD2 build execution scope." -ForegroundColor Green

Write-Host ""
Write-Host "EXECUTING MATERIAL-CORRECTION R6-G1 RD2 BUILDER ONCE..." -ForegroundColor Cyan
Write-Host ""
& $Stage
