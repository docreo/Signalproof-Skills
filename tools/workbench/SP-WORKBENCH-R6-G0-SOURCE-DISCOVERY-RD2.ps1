$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

# Signalproof Workbench GUI RD2 R6
# R6-G0 SOURCE IDENTITY DISCOVERY RD2
# Read-only against candidate and production state.
# Writes a fresh evidence lane only. Does not compile, execute product code,
# mutate production, touch Governor/Core, change ACLs, or append canonical ledger.

$EvidenceRoot = "F:\Downloads\Quarantine\Evidence"
$CandidateRoot = Join-Path $EvidenceRoot "Signalproof-Workbench-GUI-RD2-R5.1-DETERMINISTIC-SCROLL"
$OutputDir = Join-Path $EvidenceRoot "SP-WORKBENCH-R6-G0-DISCOVERY-EV-RD2"
$ReportPath = Join-Path $OutputDir "R6-G0-SOURCE-IDENTITY-DISCOVERY.txt"
$JsonPath = Join-Path $OutputDir "R6-G0-SOURCE-IDENTITY-DISCOVERY.json"
$SelectedCopyPath = Join-Path $OutputDir "R6-G0-SELECTED-SOURCE.cs"

$HistoricalSourceSha = "B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12"
$ExpectedProductionExeSha = "C47416969095B83B9788ED939BB31CC90A75EBA40FD330A9EEB5DEB30FB6174F"
$ProductionExe = "F:\Signalproof\Apps\Signalproof Governor\client\Signalproof-LLM-Workbench-V1-RD3.exe"

function Stop-R6([string]$Message) { throw ("STOP: " + $Message) }
function Pass-R6([bool]$Condition,[string]$Message) {
    if (-not $Condition) { Stop-R6 $Message }
    Write-Host ("PASS: " + $Message) -ForegroundColor Green
}
function Get-Sha256Upper([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { Stop-R6 ("missing file: " + $Path) }
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256 -ErrorAction Stop).Hash.ToUpperInvariant()
}
function Has-Text([string]$Text,[string]$Needle) {
    return ($Text.IndexOf($Needle,[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
}
function Count-Text([string]$Text,[string]$Needle) {
    if ([string]::IsNullOrEmpty($Needle)) { return 0 }
    $Count = 0
    $Pos = 0
    while ($true) {
        $Found = $Text.IndexOf($Needle,$Pos,[System.StringComparison]::OrdinalIgnoreCase)
        if ($Found -lt 0) { break }
        $Count++
        $Pos = $Found + $Needle.Length
    }
    return $Count
}
function Write-Utf8NoBom([string]$Path,[string]$Text) {
    [System.IO.File]::WriteAllText($Path,$Text,(New-Object System.Text.UTF8Encoding($false)))
}
function Get-ContextBlock([string[]]$Lines,[string]$Pattern,[int]$Before=3,[int]$After=8) {
    $Out = New-Object System.Collections.Generic.List[string]
    for ($i=0; $i -lt $Lines.Length; $i++) {
        if ($Lines[$i].IndexOf($Pattern,[System.StringComparison]::OrdinalIgnoreCase) -lt 0) { continue }
        $s = [Math]::Max(0,$i-$Before)
        $e = [Math]::Min($Lines.Length-1,$i+$After)
        [void]$Out.Add(("--- {0} @ line {1} ---" -f $Pattern,($i+1)))
        for ($j=$s; $j -le $e; $j++) {
            [void]$Out.Add(("{0,5}: {1}" -f ($j+1),$Lines[$j]))
        }
        [void]$Out.Add("")
        if ($Out.Count -gt 220) { break }
    }
    return [string[]]$Out.ToArray()
}

# Exact-final self parse before evidence write.
$Tokens = $null
$Errors = $null
[System.Management.Automation.Language.Parser]::ParseFile($PSCommandPath,[ref]$Tokens,[ref]$Errors) | Out-Null
if ($null -ne $Errors -and @($Errors).Count -gt 0) {
    $Errors | ForEach-Object {
        Write-Host ("LINE {0}, COL {1}: {2}" -f $_.Extent.StartLineNumber,$_.Extent.StartColumnNumber,$_.Message) -ForegroundColor Red
    }
    Stop-R6 "exact-final RD2 parser preflight failed"
}

$SelfSha = Get-Sha256Upper $PSCommandPath

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 SOURCE DISCOVERY RD2" -ForegroundColor Cyan
Write-Host " STRUCTURAL IDENTITY DISCRIMINATOR / READ ONLY" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ("RUNNER SHA256 : " + $SelfSha)

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)
$IsAdmin = $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Pass-R6 (-not $IsAdmin) "runs as normal non-elevated owner"
Pass-R6 (-not (Test-Path -LiteralPath $OutputDir)) "fresh RD2 evidence lane absent"
Pass-R6 (Test-Path -LiteralPath $CandidateRoot -PathType Container) "R5.1 candidate root exists"
Pass-R6 (Test-Path -LiteralPath $ProductionExe -PathType Leaf) "production Workbench exists"
Pass-R6 ((Get-Sha256Upper $ProductionExe) -eq $ExpectedProductionExeSha) "production Workbench protected identity exact"

$Files = @(Get-ChildItem -LiteralPath $CandidateRoot -File -Filter *.cs -Recurse -ErrorAction Stop | Sort-Object FullName)
Pass-R6 ($Files.Count -gt 0) "candidate root contains C# source files"

$Rows = New-Object System.Collections.Generic.List[object]
$Structural = New-Object System.Collections.Generic.List[object]
$Historical = New-Object System.Collections.Generic.List[object]

foreach ($File in $Files) {
    $Text = [System.IO.File]::ReadAllText($File.FullName,[System.Text.Encoding]::UTF8)
    $Sha = Get-Sha256Upper $File.FullName

    $HasRich = Has-Text $Text "RichTextBox"
    $HasGov = Has-Text $Text "Signalproof.Governor.Request.v1"
    $HasCreateSession = Has-Text $Text "CreateSession"
    $HasDeleteSession = Has-Text $Text "DeleteSession"
    $HasCreateBot = Has-Text $Text "CreateBot"
    $HasDeleteBot = Has-Text $Text "DeleteBot"
    $HasNativeScroll = Has-Text $Text "transcript_native_bottom_scroll"
    $HasOverlap = Has-Text $Text "composer_overlap_prevented"
    $HasTimerMarker = Has-Text $Text "transcript_follow_timer"
    $HasDirectOllama = Has-Text $Text "127.0.0.1:11434"
    $HasProcessStart = Has-Text $Text "Process.Start"
    $HasBadTranscript = Has-Text $Text "FlowLayoutPanel transcript"

    $Score = 0
    if ($HasRich) { $Score += 2 }
    if ($HasGov) { $Score += 4 }
    if ($HasCreateSession) { $Score += 1 }
    if ($HasDeleteSession) { $Score += 2 }
    if ($HasCreateBot) { $Score += 1 }
    if ($HasDeleteBot) { $Score += 2 }
    if ($HasNativeScroll) { $Score += 3 }
    if ($HasOverlap) { $Score += 3 }
    if ($HasTimerMarker) { $Score += 1 }
    if (-not $HasDirectOllama) { $Score += 2 }
    if (-not $HasProcessStart) { $Score += 2 }
    if (-not $HasBadTranscript) { $Score += 1 }

    $Row = [pscustomobject]@{
        path = $File.FullName
        sha256 = $Sha
        bytes = $File.Length
        last_write_utc = $File.LastWriteTimeUtc.ToString("o")
        historical_hash_match = ($Sha -eq $HistoricalSourceSha)
        structural_score = $Score
        richtextbox = $HasRich
        governor_pipe = $HasGov
        create_session = $HasCreateSession
        delete_session = $HasDeleteSession
        create_bot = $HasCreateBot
        delete_bot = $HasDeleteBot
        native_bottom_scroll_marker = $HasNativeScroll
        composer_overlap_marker = $HasOverlap
        follow_timer_marker = $HasTimerMarker
        direct_ollama = $HasDirectOllama
        process_start = $HasProcessStart
        flowlayout_transcript = $HasBadTranscript
        richtextbox_count = Count-Text $Text "RichTextBox"
        appendtext_count = Count-Text $Text "AppendText"
    }
    [void]$Rows.Add($Row)

    if ($Sha -eq $HistoricalSourceSha) { [void]$Historical.Add($Row) }

    $MeetsProtectedShape =
        $HasRich -and
        $HasGov -and
        $HasCreateSession -and
        $HasDeleteSession -and
        $HasCreateBot -and
        $HasDeleteBot -and
        $HasNativeScroll -and
        $HasOverlap -and
        (-not $HasDirectOllama) -and
        (-not $HasProcessStart) -and
        (-not $HasBadTranscript)

    if ($MeetsProtectedShape) { [void]$Structural.Add($Row) }
}

Write-Host ""
Write-Host ("C# FILE COUNT            : " + $Rows.Count)
Write-Host ("HISTORICAL HASH MATCHES  : " + $Historical.Count)
Write-Host ("STRUCTURAL CANDIDATES    : " + $Structural.Count)

foreach ($Row in @($Rows | Sort-Object -Property @{Expression='structural_score';Descending=$true}, @{Expression='path';Descending=$false})) {
    Write-Host ""
    Write-Host ("SCORE {0,2} | {1}" -f $Row.structural_score,$Row.path)
    Write-Host ("  SHA256      : " + $Row.sha256)
    Write-Host ("  Historical  : " + $Row.historical_hash_match)
    Write-Host ("  Gov/Rich    : {0}/{1}" -f $Row.governor_pipe,$Row.richtextbox)
    Write-Host ("  Session/Bot : C{0} D{1} / C{2} D{3}" -f $Row.create_session,$Row.delete_session,$Row.create_bot,$Row.delete_bot)
    Write-Host ("  Scroll/Overlap/Timer: {0}/{1}/{2}" -f $Row.native_bottom_scroll_marker,$Row.composer_overlap_marker,$Row.follow_timer_marker)
    Write-Host ("  DirectOllama/Process.Start/BadFlowTranscript: {0}/{1}/{2}" -f $Row.direct_ollama,$Row.process_start,$Row.flowlayout_transcript)
}

# Selection rule:
# 1) exactly one structural candidate -> selected
# 2) else exactly one historical hash match that also carries Governor+RichTextBox -> selected
# Anything else remains unresolved and must not be guessed.
$Selected = $null
$SelectionRule = ""

if ($Structural.Count -eq 1) {
    $Selected = $Structural[0]
    $SelectionRule = "unique protected structural candidate"
}
elseif ($Historical.Count -eq 1) {
    $H = $Historical[0]
    if ($H.governor_pipe -and $H.richtextbox -and (-not $H.direct_ollama) -and (-not $H.process_start)) {
        $Selected = $H
        $SelectionRule = "unique historical hash candidate with protected Governor/RichTextBox shape"
    }
}

New-Item -ItemType Directory -Path $OutputDir -ErrorAction Stop | Out-Null

$Evidence = [ordered]@{
    schema = "signalproof.workbench.r6.g0.source-identity-discovery.v2"
    disposition = $(if ($null -ne $Selected) { "PASS_SOURCE_IDENTITY_DISCOVERED" } else { "STOP_SOURCE_IDENTITY_AMBIGUOUS" })
    runner_sha256 = $SelfSha
    candidate_root = $CandidateRoot
    historical_source_sha256 = $HistoricalSourceSha
    production_exe_sha256 = (Get-Sha256Upper $ProductionExe)
    cs_file_count = $Rows.Count
    historical_hash_match_count = $Historical.Count
    structural_candidate_count = $Structural.Count
    selection_rule = $SelectionRule
    selected_path = $(if ($null -ne $Selected) { $Selected.path } else { $null })
    selected_sha256 = $(if ($null -ne $Selected) { $Selected.sha256 } else { $null })
    files = [object[]]$Rows.ToArray()
}
Write-Utf8NoBom $JsonPath ($Evidence | ConvertTo-Json -Depth 7)

$Report = New-Object System.Text.StringBuilder
[void]$Report.AppendLine("SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 SOURCE IDENTITY DISCOVERY RD2")
[void]$Report.AppendLine(("Runner SHA256: " + $SelfSha))
[void]$Report.AppendLine(("Candidate root: " + $CandidateRoot))
[void]$Report.AppendLine(("C# files: " + $Rows.Count))
[void]$Report.AppendLine(("Historical hash matches: " + $Historical.Count))
[void]$Report.AppendLine(("Structural candidates: " + $Structural.Count))
[void]$Report.AppendLine("")

foreach ($Row in @($Rows | Sort-Object -Property @{Expression='structural_score';Descending=$true}, @{Expression='path';Descending=$false})) {
    [void]$Report.AppendLine(("SCORE {0,2} | {1}" -f $Row.structural_score,$Row.path))
    [void]$Report.AppendLine(("SHA256: " + $Row.sha256))
    [void]$Report.AppendLine(("Historical: " + $Row.historical_hash_match))
    [void]$Report.AppendLine(("Governor/RichTextBox: {0}/{1}" -f $Row.governor_pipe,$Row.richtextbox))
    [void]$Report.AppendLine(("Session C/D: {0}/{1} | Bot C/D: {2}/{3}" -f $Row.create_session,$Row.delete_session,$Row.create_bot,$Row.delete_bot))
    [void]$Report.AppendLine(("NativeScroll/Overlap/Timer: {0}/{1}/{2}" -f $Row.native_bottom_scroll_marker,$Row.composer_overlap_marker,$Row.follow_timer_marker))
    [void]$Report.AppendLine(("DirectOllama/ProcessStart/BadFlowTranscript: {0}/{1}/{2}" -f $Row.direct_ollama,$Row.process_start,$Row.flowlayout_transcript))
    [void]$Report.AppendLine("")
}

if ($null -ne $Selected) {
    $SelectedPath = [string]$Selected.path
    $SelectedText = [System.IO.File]::ReadAllText($SelectedPath,[System.Text.Encoding]::UTF8)
    $SelectedLines = [System.IO.File]::ReadAllLines($SelectedPath,[System.Text.Encoding]::UTF8)

    # Copy exact selected source into fresh evidence lane so Builder can receive the
    # exact bytes without touching the original candidate.
    [System.IO.File]::Copy($SelectedPath,$SelectedCopyPath,$false)
    Pass-R6 ((Get-Sha256Upper $SelectedCopyPath) -eq $Selected.sha256) "evidence copy preserves selected source identity"

    [void]$Report.AppendLine("DISPOSITION: PASS_SOURCE_IDENTITY_DISCOVERED")
    [void]$Report.AppendLine(("SELECTION RULE: " + $SelectionRule))
    [void]$Report.AppendLine(("SELECTED PATH: " + $SelectedPath))
    [void]$Report.AppendLine(("SELECTED SHA256: " + $Selected.sha256))
    [void]$Report.AppendLine(("EVIDENCE SOURCE COPY: " + $SelectedCopyPath))
    [void]$Report.AppendLine("")
    [void]$Report.AppendLine("PATCH ANCHOR CONTEXT:")

    $AnchorPatterns = @(
        "RichTextBox",
        "WM_VSCROLL",
        "SB_BOTTOM",
        "ScrollToCaret",
        "RowStyle(SizeType.Absolute, 102",
        "KeyDown",
        "AppendText",
        "CreateSession",
        "DeleteSession",
        "CreateBot",
        "DeleteBot",
        "Signalproof.Governor.Request.v1",
        "composer_overlap_prevented",
        "transcript_native_bottom_scroll",
        "transcript_follow_timer"
    )
    foreach ($Pattern in $AnchorPatterns) {
        foreach ($Line in @(Get-ContextBlock -Lines $SelectedLines -Pattern $Pattern)) {
            [void]$Report.AppendLine($Line)
        }
    }
}
else {
    [void]$Report.AppendLine("DISPOSITION: STOP_SOURCE_IDENTITY_AMBIGUOUS")
    [void]$Report.AppendLine("No source was selected or copied. Do not patch by guess.")
}

Write-Utf8NoBom $ReportPath $Report.ToString()
Pass-R6 (Test-Path -LiteralPath $ReportPath -PathType Leaf) "RD2 discovery report written"
Pass-R6 (Test-Path -LiteralPath $JsonPath -PathType Leaf) "RD2 discovery JSON written"

if ($null -eq $Selected) {
    Write-Host ""
    Write-Host "======================================================================" -ForegroundColor Yellow
    Write-Host " R6-G0 RD2 STOP / SOURCE IDENTITY STILL AMBIGUOUS" -ForegroundColor Yellow
    Write-Host "======================================================================" -ForegroundColor Yellow
    Write-Host ("REPORT: " + $ReportPath)
    Write-Host ("JSON  : " + $JsonPath)
    exit 2
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Green
Write-Host " R6-G0 RD2 PASS / SOURCE IDENTITY DISCOVERED" -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Green
Write-Host ("SELECTED : " + $Selected.path)
Write-Host ("SHA256   : " + $Selected.sha256)
Write-Host ("COPY     : " + $SelectedCopyPath)
Write-Host ("REPORT   : " + $ReportPath)
Write-Host ("JSON     : " + $JsonPath)
Write-Host ""
Write-Host "NEXT: return console output plus the selected source copy to the Builder chat."
