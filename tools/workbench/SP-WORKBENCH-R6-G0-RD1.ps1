$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

# Signalproof Workbench GUI RD2 R6
# R6-G0 RECEIVE / RECONCILE / EXACT SOURCE LOCALIZATION
# READ ONLY against protected/current Workbench state.
# Writes only a fresh evidence report lane under F:\Downloads\Quarantine\Evidence.
# No production mutation. No compilation. No process start/stop. No ACL changes.
# No Governor/Core changes. No provider/tool execution. No canonical ledger append.

$EvidenceRoot = "F:\Downloads\Quarantine\Evidence"
$CandidateRoot = Join-Path $EvidenceRoot "Signalproof-Workbench-GUI-RD2-R5.1-DETERMINISTIC-SCROLL"
$OutputDir = Join-Path $EvidenceRoot "SP-WORKBENCH-R6-G0-EV-RD1"
$ReportPath = Join-Path $OutputDir "R6-G0-SOURCE-LOCALIZATION.txt"
$EvidencePath = Join-Path $OutputDir "R6-G0-SOURCE-LOCALIZATION.json"

$ExpectedSourceSha = "B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12"
$ExpectedProductionExeSha = "C47416969095B83B9788ED939BB31CC90A75EBA40FD330A9EEB5DEB30FB6174F"
$ProductionExe = "F:\Signalproof\Apps\Signalproof Governor\client\Signalproof-LLM-Workbench-V1-RD3.exe"
$ExpectedLogoSha = "4B660A3C4F9F75BEF0F6552747A61FD8178ACD0AA6C0B4F441FB9EB69CC88EDD"

function Pass-R6 {
    param([bool]$Condition,[string]$Message)
    if (-not $Condition) {
        throw ("STOP: " + $Message)
    }
    Write-Host ("PASS: " + $Message) -ForegroundColor Green
}

function Get-Sha256Upper {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw ("STOP: required file missing: " + $Path)
    }
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256 -ErrorAction Stop).Hash.ToUpperInvariant()
}

function Get-PropertyValue {
    param($Object,[string]$Name)
    if ($null -eq $Object) { return $null }
    $Property = $Object.PSObject.Properties[$Name]
    if ($null -eq $Property) { return $null }
    return $Property.Value
}

function Write-Utf8NoBom {
    param([string]$Path,[string]$Text)
    [System.IO.File]::WriteAllText(
        $Path,
        $Text,
        (New-Object System.Text.UTF8Encoding($false))
    )
}

function Get-ContextHits {
    param(
        [string[]]$Lines,
        [string]$Pattern,
        [int]$Before = 4,
        [int]$After = 8
    )

    $Hits = New-Object System.Collections.Generic.List[object]

    for ($Index = 0; $Index -lt $Lines.Length; $Index++) {
        if ($Lines[$Index].IndexOf($Pattern,[System.StringComparison]::OrdinalIgnoreCase) -lt 0) {
            continue
        }

        $Start = [Math]::Max(0,$Index - $Before)
        $End = [Math]::Min($Lines.Length - 1,$Index + $After)
        $Context = New-Object System.Collections.Generic.List[string]

        for ($LineIndex = $Start; $LineIndex -le $End; $LineIndex++) {
            [void]$Context.Add(("{0,5}: {1}" -f ($LineIndex + 1),$Lines[$LineIndex]))
        }

        $Hits.Add(
            [pscustomobject]@{
                pattern = $Pattern
                line = $Index + 1
                context = [string[]]$Context.ToArray()
            }
        )
    }

    return [object[]]$Hits.ToArray()
}

# Exact-final self parser preflight. This is intentionally before any evidence write.
$SelfTokens = $null
$SelfErrors = $null
[System.Management.Automation.Language.Parser]::ParseFile(
    $PSCommandPath,
    [ref]$SelfTokens,
    [ref]$SelfErrors
) | Out-Null

if ($null -ne $SelfErrors -and @($SelfErrors).Count -ne 0) {
    $SelfErrors | ForEach-Object {
        Write-Host (
            "LINE " +
            $_.Extent.StartLineNumber +
            ", COL " +
            $_.Extent.StartColumnNumber +
            ": " +
            $_.Message
        ) -ForegroundColor Red
    }
    throw "STOP: exact-final R6-G0 PowerShell parser preflight failed."
}

$SelfSha = Get-Sha256Upper $PSCommandPath

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD1" -ForegroundColor Cyan
Write-Host " RECEIVE / RECONCILE / EXACT R5.1 SOURCE LOCALIZATION" -ForegroundColor Cyan
Write-Host " READ-ONLY TARGET INSPECTION / FRESH EVIDENCE LANE ONLY" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host ("RUNNER SHA256 : " + $SelfSha)

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)
$IsAdmin = $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Write-Host ("CURRENT USER   : " + $Identity.Name)
Write-Host ("IS ADMIN       : " + $IsAdmin)

Pass-R6 (-not $IsAdmin) "R6-G0 runs as normal non-elevated owner"
Pass-R6 (-not (Test-Path -LiteralPath $OutputDir)) "fresh R6-G0 evidence lane absent"
Pass-R6 (Test-Path -LiteralPath $CandidateRoot -PathType Container) "R5.1 deterministic-scroll candidate root exists"
Pass-R6 (Test-Path -LiteralPath $ProductionExe -PathType Leaf) "production Workbench exists"
Pass-R6 ((Get-Sha256Upper $ProductionExe) -eq $ExpectedProductionExeSha) "production Workbench protected identity exact"

Write-Host ""
Write-Host "=== 1. LOCATE EXACT R5.1 GUI SOURCE ===" -ForegroundColor Cyan

$SourceMatches = New-Object System.Collections.Generic.List[string]

Get-ChildItem -LiteralPath $CandidateRoot -File -Recurse -ErrorAction Stop |
    Where-Object { $_.Extension -ieq ".cs" } |
    ForEach-Object {
        $Hash = Get-Sha256Upper $_.FullName
        if ($Hash -eq $ExpectedSourceSha) {
            [void]$SourceMatches.Add($_.FullName)
        }
    }

Pass-R6 ($SourceMatches.Count -eq 1) "exactly one R5.1 C# source matches expected SHA256"
$SourcePath = $SourceMatches[0]
Write-Host ("SOURCE PATH    : " + $SourcePath)
Write-Host ("SOURCE SHA256  : " + (Get-Sha256Upper $SourcePath))

$SourceText = [System.IO.File]::ReadAllText($SourcePath,[System.Text.Encoding]::UTF8)
$Lines = [System.IO.File]::ReadAllLines($SourcePath,[System.Text.Encoding]::UTF8)

Pass-R6 ($SourceText.IndexOf("RichTextBox",[System.StringComparison]::Ordinal) -ge 0) "R5.1 source contains RichTextBox transcript architecture"
Pass-R6 ($SourceText.IndexOf("FlowLayoutPanel transcript",[System.StringComparison]::OrdinalIgnoreCase) -lt 0) "disproved FlowLayoutPanel transcript declaration absent"
Pass-R6 ($SourceText.IndexOf("composer_overlap_prevented",[System.StringComparison]::Ordinal) -ge 0) "composer overlap prevention self-test marker present"
Pass-R6 ($SourceText.IndexOf("transcript_native_bottom_scroll",[System.StringComparison]::Ordinal) -ge 0) "native bottom-scroll self-test marker present"
Pass-R6 ($SourceText.IndexOf("transcript_follow_timer",[System.StringComparison]::Ordinal) -ge 0) "removed timer state remains explicit in self-test contract"

Write-Host ""
Write-Host "=== 2. LOCALIZE R6-G1 PATCH AUTHORITY ANCHORS ===" -ForegroundColor Cyan

$Patterns = @(
    "RichTextBox",
    "WM_VSCROLL",
    "SB_BOTTOM",
    "ScrollToCaret",
    "RowStyle(SizeType.Absolute, 102",
    "KeyDown",
    "Shift",
    "AppendText",
    "transcript_native_bottom_scroll",
    "composer_overlap_prevented",
    "transcript_follow_timer",
    "CreateSession",
    "RenameSession",
    "DeleteSession",
    "CreateBot",
    "RenameBot",
    "DeleteBot",
    "NamedPipeClientStream",
    "Signalproof.Governor.Request.v1",
    "Process.Start",
    "127.0.0.1:11434"
)

$AllHits = New-Object System.Collections.Generic.List[object]
foreach ($Pattern in $Patterns) {
    $PatternHits = @(Get-ContextHits -Lines $Lines -Pattern $Pattern)
    foreach ($Hit in $PatternHits) {
        $AllHits.Add($Hit)
    }
    Write-Host ("{0,-42} {1,4} hit(s)" -f $Pattern,@($PatternHits).Count)
}

# Contract-critical direct bypass checks.
$HasGovernorPipe = $SourceText.IndexOf("Signalproof.Governor.Request.v1",[System.StringComparison]::Ordinal) -ge 0
$HasDirectOllama = $SourceText.IndexOf("127.0.0.1:11434",[System.StringComparison]::OrdinalIgnoreCase) -ge 0
$HasProcessStart = $SourceText.IndexOf("Process.Start",[System.StringComparison]::Ordinal) -ge 0

Pass-R6 $HasGovernorPipe "governed Governor request pipe remains present"
Pass-R6 (-not $HasDirectOllama) "no direct Ollama endpoint in GUI source"
Pass-R6 (-not $HasProcessStart) "no direct Process.Start execution surface in GUI source"

Write-Host ""
Write-Host "=== 3. BRAND / ASSET IDENTITY DISCOVERY ===" -ForegroundColor Cyan

$LogoMatches = New-Object System.Collections.Generic.List[string]
Get-ChildItem -LiteralPath $CandidateRoot -File -Recurse -ErrorAction Stop |
    Where-Object { $_.Name -ieq "product-logo.png" } |
    ForEach-Object {
        if ((Get-Sha256Upper $_.FullName) -eq $ExpectedLogoSha) {
            [void]$LogoMatches.Add($_.FullName)
        }
    }

Pass-R6 ($LogoMatches.Count -ge 1) "approved circular red Signalproof logo present in R5.1 candidate"
foreach ($LogoPath in $LogoMatches) {
    Write-Host ("LOGO EXACT     : " + $LogoPath)
}

Write-Host ""
Write-Host "=== 4. WRITE FRESH R6-G0 EVIDENCE ===" -ForegroundColor Cyan

New-Item -ItemType Directory -Path $OutputDir -ErrorAction Stop | Out-Null

$Evidence = [ordered]@{
    schema = "signalproof.workbench.r6.g0.source-localization.v1"
    workstream = "Signalproof Workbench GUI RD2"
    gate = "R6-G0 RECEIVE AND RECONCILE"
    disposition = "PASS_SOURCE_LOCALIZED"
    runner_path = $PSCommandPath
    runner_sha256 = $SelfSha
    executed_by = $Identity.Name
    is_admin = $IsAdmin
    r5_1_candidate_root = $CandidateRoot
    r5_1_source_path = $SourcePath
    r5_1_source_sha256 = Get-Sha256Upper $SourcePath
    production_exe = $ProductionExe
    production_exe_sha256 = Get-Sha256Upper $ProductionExe
    approved_logo_sha256 = $ExpectedLogoSha
    approved_logo_paths = [string[]]$LogoMatches.ToArray()
    protected_contract = [ordered]@{
        governor_pipe_present = $HasGovernorPipe
        direct_ollama_absent = (-not $HasDirectOllama)
        process_start_absent = (-not $HasProcessStart)
        richtextbox_transcript_present = ($SourceText.IndexOf("RichTextBox",[System.StringComparison]::Ordinal) -ge 0)
        flowlayout_transcript_absent = ($SourceText.IndexOf("FlowLayoutPanel transcript",[System.StringComparison]::OrdinalIgnoreCase) -lt 0)
        transcript_native_bottom_scroll_marker = ($SourceText.IndexOf("transcript_native_bottom_scroll",[System.StringComparison]::Ordinal) -ge 0)
        composer_overlap_prevented_marker = ($SourceText.IndexOf("composer_overlap_prevented",[System.StringComparison]::Ordinal) -ge 0)
    }
    localization_hits = [object[]]$AllHits.ToArray()
    next_gate = "R6-G1 UX HOUSEKEEPING CANDIDATE"
}

# ConvertTo-Json is acceptable for evidence here because keys are controlled and non-empty.
$EvidenceJson = $Evidence | ConvertTo-Json -Depth 8
Write-Utf8NoBom $EvidencePath $EvidenceJson

$Report = New-Object System.Text.StringBuilder
[void]$Report.AppendLine("SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 SOURCE LOCALIZATION")
[void]$Report.AppendLine(("Runner SHA256: " + $SelfSha))
[void]$Report.AppendLine(("R5.1 source: " + $SourcePath))
[void]$Report.AppendLine(("R5.1 source SHA256: " + (Get-Sha256Upper $SourcePath)))
[void]$Report.AppendLine(("Production EXE SHA256: " + (Get-Sha256Upper $ProductionExe)))
[void]$Report.AppendLine("")
[void]$Report.AppendLine("DISPOSITION: PASS_SOURCE_LOCALIZED")
[void]$Report.AppendLine("NEXT GATE: R6-G1 UX HOUSEKEEPING CANDIDATE")
[void]$Report.AppendLine("")
[void]$Report.AppendLine("LOCALIZATION HITS:")

foreach ($Hit in $AllHits) {
    [void]$Report.AppendLine("")
    [void]$Report.AppendLine(("--- " + [string]$Hit.pattern + " @ line " + [string]$Hit.line + " ---"))
    foreach ($ContextLine in @($Hit.context)) {
        [void]$Report.AppendLine([string]$ContextLine)
    }
}

Write-Utf8NoBom $ReportPath $Report.ToString()

Pass-R6 (Test-Path -LiteralPath $EvidencePath -PathType Leaf) "R6-G0 JSON evidence written"
Pass-R6 (Test-Path -LiteralPath $ReportPath -PathType Leaf) "R6-G0 localization report written"

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Green
Write-Host " R6-G0 PASS / SOURCE LOCALIZED" -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Green
Write-Host ("REPORT   : " + $ReportPath)
Write-Host ("EVIDENCE : " + $EvidencePath)
Write-Host ""
Write-Host "NEXT: return the report/evidence to the Builder chat."
Write-Host "No production files were changed."
