$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$EvidenceRoot = "F:\Downloads\Quarantine\Evidence"
$Rd3Dir = Join-Path $EvidenceRoot "SP-WORKBENCH-R6-G0-EV-RD3"
$RecoveredSource = Join-Path (Join-Path $Rd3Dir "recovered") "SignalproofWorkbenchGuiRd2-R5.1-RECOVERED.cs"
$OutputDir = Join-Path $EvidenceRoot "SP-WORKBENCH-R6-G0-EV-RD4"
$ReportPath = Join-Path $OutputDir "R6-G0-RD4-SOURCE-LOCALIZATION.txt"
$JsonPath = Join-Path $OutputDir "R6-G0-RD4-SOURCE-LOCALIZATION.json"

$ExpectedSourceSha = "B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12"
$ProductionExe = "F:\Signalproof\Apps\Signalproof Governor\client\Signalproof-LLM-Workbench-V1-RD3.exe"
$ExpectedProductionExeSha = "C47416969095B83B9788ED939BB31CC90A75EBA40FD330A9EEB5DEB30FB6174F"

function Get-Sha256Upper {
    param([string]$Path)
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256 -ErrorAction Stop).Hash.ToUpperInvariant()
}
function Pass-R6 {
    param([bool]$Condition,[string]$Message)
    if (-not $Condition) { throw ("STOP: " + $Message) }
    Write-Host ("PASS: " + $Message) -ForegroundColor Green
}
function Write-Utf8NoBom {
    param([string]$Path,[string]$Text)
    [System.IO.File]::WriteAllText($Path,$Text,(New-Object System.Text.UTF8Encoding($false)))
}
function Add-Context {
    param([System.Text.StringBuilder]$Builder,[string[]]$Lines,[int]$Index,[int]$Before=3,[int]$After=7)
    $Start=[Math]::Max(0,$Index-$Before)
    $End=[Math]::Min($Lines.Length-1,$Index+$After)
    for($j=$Start;$j -le $End;$j++){ [void]$Builder.AppendLine(("{0}: {1}" -f ($j+1),$Lines[$j])) }
}
function Get-UniquePreservePath {
    param([string]$Root,[string]$BaseName)
    $Stamp=Get-Date -Format "yyyyMMdd-HHmmss"
    $Candidate=Join-Path $Root ($BaseName+"-"+$Stamp)
    $Counter=1
    while(Test-Path -LiteralPath $Candidate){
        $Candidate=Join-Path $Root ($BaseName+"-"+$Stamp+"-"+$Counter)
        $Counter++
    }
    return $Candidate
}
function Test-ReusableEvidence {
    param([string]$EvidenceJsonPath)
    if(-not (Test-Path -LiteralPath $EvidenceJsonPath -PathType Leaf)){ return $false }
    try {
        $Raw=[System.IO.File]::ReadAllText($EvidenceJsonPath,[System.Text.Encoding]::UTF8)
        $Obj=$Raw | ConvertFrom-Json
        if($null -eq $Obj){ return $false }
        $SchemaProp=$Obj.PSObject.Properties["schema"]
        $SourceProp=$Obj.PSObject.Properties["source_sha256"]
        $ProdProp=$Obj.PSObject.Properties["production_sha256"]
        $DispProp=$Obj.PSObject.Properties["disposition"]
        if($null -eq $SchemaProp -or $null -eq $SourceProp -or $null -eq $ProdProp -or $null -eq $DispProp){ return $false }
        if([string]$SchemaProp.Value -ne "signalproof.workbench.r6.g0.rd4.localization.v1"){ return $false }
        if(([string]$SourceProp.Value).ToUpperInvariant() -ne $ExpectedSourceSha){ return $false }
        if(([string]$ProdProp.Value).ToUpperInvariant() -ne $ExpectedProductionExeSha){ return $false }
        if([string]$DispProp.Value -ne "PASS_EXACT_SOURCE_LOCALIZED_FOR_G1"){ return $false }
        return $true
    } catch {
        return $false
    }
}

$Tokens=$null
$Errors=$null
[System.Management.Automation.Language.Parser]::ParseFile($PSCommandPath,[ref]$Tokens,[ref]$Errors) | Out-Null
if($null -ne $Errors -and @($Errors).Count -gt 0){
    $Errors | ForEach-Object { Write-Host ("LINE "+$_.Extent.StartLineNumber+": "+$_.Message) -ForegroundColor Red }
    throw "STOP: exact-final R6-G0 RD4.1 parser preflight failed."
}
$SelfSha=Get-Sha256Upper $PSCommandPath

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD4.1" -ForegroundColor Cyan
Write-Host " EVIDENCE-REUSE / PRESERVE-PARTIAL / EXACT SOURCE INTROSPECTION" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ("RUNNER SHA256 : "+$SelfSha)

$Identity=[Security.Principal.WindowsIdentity]::GetCurrent()
$Principal=New-Object Security.Principal.WindowsPrincipal($Identity)
$IsAdmin=$Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Pass-R6 (-not $IsAdmin) "normal non-elevated owner"
Pass-R6 (Test-Path -LiteralPath $RecoveredSource -PathType Leaf) "RD3 recovered source exists"
Pass-R6 ((Get-Sha256Upper $RecoveredSource) -eq $ExpectedSourceSha) "RD3 recovered source identity exact"
Pass-R6 (Test-Path -LiteralPath $ProductionExe -PathType Leaf) "production Workbench exists"
Pass-R6 ((Get-Sha256Upper $ProductionExe) -eq $ExpectedProductionExeSha) "production Workbench protected identity exact"

if(Test-Path -LiteralPath $OutputDir){
    if((Test-Path -LiteralPath $ReportPath -PathType Leaf) -and (Test-ReusableEvidence $JsonPath)){
        Write-Host "PASS: existing RD4 evidence is complete, identity-bound, and reusable." -ForegroundColor Green
        Write-Host ""
        Write-Host "=== REUSED RD4 LOCALIZATION REPORT ===" -ForegroundColor Cyan
        Get-Content -LiteralPath $ReportPath
        Write-Host ""
        Write-Host "======================================================================" -ForegroundColor Green
        Write-Host " R6-G0 RD4.1 PASS / REUSED VALID RD4 EVIDENCE / G1 READY" -ForegroundColor Green
        Write-Host "======================================================================" -ForegroundColor Green
        Write-Host ("REPORT   : "+$ReportPath)
        Write-Host ("EVIDENCE : "+$JsonPath)
        return
    }

    $Preserved=Get-UniquePreservePath $EvidenceRoot "SP-WORKBENCH-R6-G0-EV-RD4-PRESERVED"
    Move-Item -LiteralPath $OutputDir -Destination $Preserved -ErrorAction Stop
    Write-Host ("PASS: preserved pre-existing incomplete/stale RD4 evidence lane: "+$Preserved) -ForegroundColor Green
}

$Source=[System.IO.File]::ReadAllText($RecoveredSource,[System.Text.Encoding]::UTF8)
$Lines=[System.IO.File]::ReadAllLines($RecoveredSource,[System.Text.Encoding]::UTF8)

Pass-R6 ($Source.IndexOf("RichTextBox",[System.StringComparison]::OrdinalIgnoreCase) -ge 0) "RichTextBox transcript architecture present"
Pass-R6 ($Source.IndexOf("Signalproof.Governor.Request.v1",[System.StringComparison]::OrdinalIgnoreCase) -ge 0) "Governor request pipe present"
Pass-R6 ($Source.IndexOf("127.0.0.1:11434",[System.StringComparison]::OrdinalIgnoreCase) -lt 0) "direct Ollama endpoint absent"
Pass-R6 ($Source.IndexOf("Process.Start",[System.StringComparison]::OrdinalIgnoreCase) -lt 0) "direct Process.Start absent"

New-Item -ItemType Directory -Path $OutputDir -ErrorAction Stop | Out-Null

$MethodRegex = [regex]'(?m)^\s*(?:public|private|protected|internal)\s+(?:static\s+)?(?:async\s+)?[\w<>\[\],\.\?]+\s+([A-Za-z_]\w*)\s*\('
$FieldRegex = [regex]'(?m)^\s*(?:private|public|protected|internal)\s+(?:readonly\s+)?(?:static\s+)?([A-Za-z_][\w<>\[\],\.]*)\s+([A-Za-z_]\w*)\s*(?:=|;)'
$StringRegex = [regex]'"([^"\r\n]{2,120})"'

$Methods=@($MethodRegex.Matches($Source) | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique)
$Fields=@($FieldRegex.Matches($Source) | ForEach-Object { [pscustomobject]@{ type=$_.Groups[1].Value; name=$_.Groups[2].Value } } | Sort-Object name)
$Strings=@($StringRegex.Matches($Source) | ForEach-Object { $_.Groups[1].Value } | Where-Object {
    $_ -match '(?i)session|bot|send|rename|delete|create|version|build|workbench|dash|copy|save|code|artifact|general|research|builder|media'
} | Sort-Object -Unique)

$Patterns=@(
    "RichTextBox","AppendText","ScrollToCaret","WM_VSCROLL","SB_BOTTOM",
    "KeyDown","Shift","Send","SESSIONS","BOTS","DASH","Create","Rename","Delete",
    "Signalproof Workbench","Governed AI Workspace","Version","AssemblyVersion","AssemblyFileVersion",
    "Signalproof.Governor.Request.v1","NamedPipeClientStream","composer_overlap_prevented",
    "transcript_native_bottom_scroll"
)

$Builder=New-Object System.Text.StringBuilder
[void]$Builder.AppendLine("SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD4.1")
[void]$Builder.AppendLine(("Runner SHA256: "+$SelfSha))
[void]$Builder.AppendLine(("Recovered source: "+$RecoveredSource))
[void]$Builder.AppendLine(("Recovered source SHA256: "+(Get-Sha256Upper $RecoveredSource)))
[void]$Builder.AppendLine("")
[void]$Builder.AppendLine("=== ACTUAL METHODS ===")
foreach($m in $Methods){ [void]$Builder.AppendLine($m) }
[void]$Builder.AppendLine("")
[void]$Builder.AppendLine("=== ACTUAL CONTROL / FIELD DECLARATIONS ===")
foreach($f in $Fields){ [void]$Builder.AppendLine(($f.type+" "+$f.name)) }
[void]$Builder.AppendLine("")
[void]$Builder.AppendLine("=== RELEVANT VISIBLE / STATE STRINGS ===")
foreach($s in $Strings){ [void]$Builder.AppendLine($s) }

$Hits=New-Object System.Collections.Generic.List[object]
[void]$Builder.AppendLine("")
[void]$Builder.AppendLine("=== LOCALIZED SOURCE CONTEXT ===")
for($i=0;$i -lt $Lines.Length;$i++){
    foreach($p in $Patterns){
        if($Lines[$i].IndexOf($p,[System.StringComparison]::OrdinalIgnoreCase) -ge 0){
            [void]$Builder.AppendLine("")
            [void]$Builder.AppendLine(("--- PATTERN: "+$p+" @ LINE "+($i+1)+" ---"))
            Add-Context $Builder $Lines $i 3 8
            [void]$Hits.Add([pscustomobject]@{ pattern=$p; line=$i+1 })
            break
        }
    }
}

Write-Utf8NoBom $ReportPath $Builder.ToString()

$Evidence=[ordered]@{
    schema="signalproof.workbench.r6.g0.rd4.localization.v1"
    runner_sha256=$SelfSha
    source_path=$RecoveredSource
    source_sha256=Get-Sha256Upper $RecoveredSource
    production_sha256=Get-Sha256Upper $ProductionExe
    method_count=@($Methods).Count
    methods=$Methods
    fields=$Fields
    relevant_strings=$Strings
    hits=$Hits
    disposition="PASS_EXACT_SOURCE_LOCALIZED_FOR_G1"
    next_gate="R6-G1 UX HOUSEKEEPING + VERSION LEGIBILITY + CODE ARTIFACT WORKSPACE"
}
Write-Utf8NoBom $JsonPath ($Evidence | ConvertTo-Json -Depth 8)

Pass-R6 (Test-Path -LiteralPath $ReportPath -PathType Leaf) "RD4.1 localization report written"
Pass-R6 (Test-Path -LiteralPath $JsonPath -PathType Leaf) "RD4.1 localization JSON written"
Pass-R6 (Test-ReusableEvidence $JsonPath) "RD4.1 written evidence structurally reusable"

Write-Host ""
Write-Host "=== ACTUAL METHODS DISCOVERED ===" -ForegroundColor Cyan
$Methods | ForEach-Object { Write-Host $_ }
Write-Host ""
Write-Host "=== RELEVANT UI/STATE STRINGS DISCOVERED ===" -ForegroundColor Cyan
$Strings | ForEach-Object { Write-Host $_ }
Write-Host ""
Write-Host "=== LOCALIZATION REPORT ===" -ForegroundColor Cyan
Get-Content -LiteralPath $ReportPath

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Green
Write-Host " R6-G0 RD4.1 PASS / EXACT SOURCE LOCALIZED FOR G1" -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Green
Write-Host ("REPORT   : "+$ReportPath)
Write-Host ("EVIDENCE : "+$JsonPath)
Write-Host ""
Write-Host "R6-G1 is ready under the active Complete envelope." -ForegroundColor Yellow
