$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$EvidenceRoot = "F:\Downloads\Quarantine\Evidence"
$CandidateRoot = Join-Path $EvidenceRoot "Signalproof-Workbench-GUI-RD2-R5.1-DETERMINISTIC-SCROLL"
$OutputDir = Join-Path $EvidenceRoot "SP-WORKBENCH-R6-G0-EV-RD2"
$ReportPath = Join-Path $OutputDir "R6-G0-RD2-SOURCE-INVENTORY.txt"
$EvidencePath = Join-Path $OutputDir "R6-G0-RD2-SOURCE-INVENTORY.json"

$ExpectedSourceSha = "B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12"
$ExpectedProductionExeSha = "C47416969095B83B9788ED939BB31CC90A75EBA40FD330A9EEB5DEB30FB6174F"
$ProductionExe = "F:\Signalproof\Apps\Signalproof Governor\client\Signalproof-LLM-Workbench-V1-RD3.exe"

function Pass-R6 {
    param([bool]$Condition,[string]$Message)
    if (-not $Condition) { throw ("STOP: " + $Message) }
    Write-Host ("PASS: " + $Message) -ForegroundColor Green
}

function Get-Sha256Upper {
    param([string]$Path)
    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256 -ErrorAction Stop).Hash.ToUpperInvariant()
}

function Write-Utf8NoBom {
    param([string]$Path,[string]$Text)
    [System.IO.File]::WriteAllText($Path,$Text,(New-Object System.Text.UTF8Encoding($false)))
}

$Tokens = $null
$Errors = $null
[System.Management.Automation.Language.Parser]::ParseFile($PSCommandPath,[ref]$Tokens,[ref]$Errors) | Out-Null
if ($null -ne $Errors -and @($Errors).Count -gt 0) {
    $Errors | ForEach-Object { Write-Host ("LINE " + $_.Extent.StartLineNumber + ": " + $_.Message) -ForegroundColor Red }
    throw "STOP: exact-final R6-G0 RD2 parser preflight failed."
}

$SelfSha = Get-Sha256Upper $PSCommandPath

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD2" -ForegroundColor Cyan
Write-Host " EXACT + STRUCTURAL SOURCE INVENTORY / READ ONLY" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ("RUNNER SHA256 : " + $SelfSha)

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)
$IsAdmin = $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Pass-R6 (-not $IsAdmin) "normal non-elevated owner"
Pass-R6 (-not (Test-Path -LiteralPath $OutputDir)) "fresh RD2 evidence lane absent"
Pass-R6 (Test-Path -LiteralPath $CandidateRoot -PathType Container) "R5.1 candidate root exists"
Pass-R6 (Test-Path -LiteralPath $ProductionExe -PathType Leaf) "production Workbench exists"
Pass-R6 ((Get-Sha256Upper $ProductionExe) -eq $ExpectedProductionExeSha) "production Workbench protected identity exact"

Write-Host ""
Write-Host "=== 1. INVENTORY ALL C# CANDIDATES ===" -ForegroundColor Cyan

$Files = @(Get-ChildItem -LiteralPath $CandidateRoot -File -Recurse -Filter *.cs -ErrorAction Stop | Sort-Object FullName)
Pass-R6 ($Files.Count -gt 0) "one or more C# candidates exist"

$Rows = @()
foreach ($File in $Files) {
    $Hash = Get-Sha256Upper $File.FullName
    $Text = [System.IO.File]::ReadAllText($File.FullName,[System.Text.Encoding]::UTF8)
    $Score = 0
    foreach ($Marker in @("RichTextBox","WM_VSCROLL","SB_BOTTOM","transcript_native_bottom_scroll","composer_overlap_prevented","Signalproof.Governor.Request.v1")) {
        if ($Text.IndexOf($Marker,[System.StringComparison]::OrdinalIgnoreCase) -ge 0) { $Score++ }
    }
    $Rows += [pscustomobject]@{
        path = $File.FullName
        sha256 = $Hash
        bytes = $File.Length
        structural_score = $Score
    }
    Write-Host (("{0}  score={1}  {2}" -f $Hash,$Score,$File.FullName))
}

$Exact = @($Rows | Where-Object { $_.sha256 -eq $ExpectedSourceSha } | Sort-Object path)
$Selected = $null
$Disposition = "STOP_SOURCE_IDENTITY_UNRESOLVED"

if ($Exact.Count -ge 1) {
    $Selected = $Exact[0]
    $Disposition = "PASS_EXACT_SOURCE_IDENTITY"
    Write-Host ("PASS: exact source identity found in " + $Exact.Count + " byte-identical path(s)") -ForegroundColor Green
} else {
    $Ranked = @($Rows | Sort-Object @{Expression={$_.structural_score};Descending=$true}, @{Expression={$_.bytes};Descending=$true}, path)
    $TopScore = [int]$Ranked[0].structural_score
    $Top = @($Ranked | Where-Object { [int]$_.structural_score -eq $TopScore })
    if ($TopScore -ge 5 -and $Top.Count -eq 1) {
        $Selected = $Top[0]
        $Disposition = "STRUCTURAL_CANDIDATE_UNIQUE_EXPECTED_SHA_MISSING"
        Write-Host "NOTICE: expected SHA absent; one unique high-confidence structural candidate localized." -ForegroundColor Yellow
    }
}

$Checks = $null
if ($null -ne $Selected) {
    Write-Host ""
    Write-Host "=== 2. LOCALIZATION CONTRACT ===" -ForegroundColor Cyan
    $SourceText = [System.IO.File]::ReadAllText([string]$Selected.path,[System.Text.Encoding]::UTF8)
    Write-Host ("SELECTED PATH   : " + [string]$Selected.path)
    Write-Host ("SELECTED SHA256 : " + [string]$Selected.sha256)
    Write-Host ("STRUCT SCORE    : " + [string]$Selected.structural_score)

    $Checks = [ordered]@{
        richtextbox = ($SourceText.IndexOf("RichTextBox",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
        wm_vscroll = ($SourceText.IndexOf("WM_VSCROLL",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
        sb_bottom = ($SourceText.IndexOf("SB_BOTTOM",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
        native_bottom_marker = ($SourceText.IndexOf("transcript_native_bottom_scroll",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
        overlap_marker = ($SourceText.IndexOf("composer_overlap_prevented",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
        governor_pipe = ($SourceText.IndexOf("Signalproof.Governor.Request.v1",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
        direct_ollama_absent = ($SourceText.IndexOf("127.0.0.1:11434",[System.StringComparison]::OrdinalIgnoreCase) -lt 0)
        process_start_absent = ($SourceText.IndexOf("Process.Start",[System.StringComparison]::OrdinalIgnoreCase) -lt 0)
    }

    Pass-R6 ([bool]$Checks.richtextbox) "RichTextBox architecture present"
    Pass-R6 ([bool]$Checks.native_bottom_marker) "native bottom marker present"
    Pass-R6 ([bool]$Checks.overlap_marker) "composer overlap marker present"
    Pass-R6 ([bool]$Checks.governor_pipe) "Governor request pipe present"
    Pass-R6 ([bool]$Checks.direct_ollama_absent) "direct Ollama endpoint absent"
    Pass-R6 ([bool]$Checks.process_start_absent) "direct Process.Start absent"
}

Write-Host ""
Write-Host "=== 3. WRITE EVIDENCE ===" -ForegroundColor Cyan
New-Item -ItemType Directory -Path $OutputDir -ErrorAction Stop | Out-Null

$Evidence = [ordered]@{
    schema = "signalproof.workbench.r6.g0.rd2.source-inventory.v1"
    runner_sha256 = $SelfSha
    user = $Identity.Name
    is_admin = $IsAdmin
    candidate_root = $CandidateRoot
    expected_source_sha256 = $ExpectedSourceSha
    production_exe_sha256 = Get-Sha256Upper $ProductionExe
    candidate_count = $Rows.Count
    candidates = $Rows
    exact_match_count = $Exact.Count
    selected = $Selected
    selected_checks = $Checks
    disposition = $Disposition
}

$Json = $Evidence | ConvertTo-Json -Depth 8
Write-Utf8NoBom $EvidencePath $Json

$Builder = New-Object System.Text.StringBuilder
[void]$Builder.AppendLine("SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD2")
[void]$Builder.AppendLine(("Runner SHA256: " + $SelfSha))
[void]$Builder.AppendLine(("Disposition: " + $Disposition))
[void]$Builder.AppendLine(("Expected source SHA256: " + $ExpectedSourceSha))
[void]$Builder.AppendLine(("Exact match count: " + $Exact.Count))
[void]$Builder.AppendLine("")
foreach ($Row in $Rows) {
    [void]$Builder.AppendLine(("SHA256=" + $Row.sha256 + " SCORE=" + $Row.structural_score + " BYTES=" + $Row.bytes))
    [void]$Builder.AppendLine(("PATH=" + $Row.path))
    [void]$Builder.AppendLine("")
}
if ($null -ne $Selected) {
    [void]$Builder.AppendLine(("SELECTED=" + $Selected.path))
    [void]$Builder.AppendLine(("SELECTED_SHA256=" + $Selected.sha256))
}
Write-Utf8NoBom $ReportPath $Builder.ToString()

Pass-R6 (Test-Path -LiteralPath $ReportPath -PathType Leaf) "RD2 report written"
Pass-R6 (Test-Path -LiteralPath $EvidencePath -PathType Leaf) "RD2 JSON evidence written"

Write-Host ""
if ($Disposition -eq "PASS_EXACT_SOURCE_IDENTITY") {
    Write-Host "======================================================================" -ForegroundColor Green
    Write-Host " R6-G0 RD2 PASS / EXACT SOURCE LOCALIZED" -ForegroundColor Green
    Write-Host " NEXT GATE: R6-G1 UX HOUSEKEEPING CANDIDATE" -ForegroundColor Green
    Write-Host "======================================================================" -ForegroundColor Green
} elseif ($null -ne $Selected) {
    Write-Host "======================================================================" -ForegroundColor Yellow
    Write-Host " R6-G0 RD2 PARTIAL / UNIQUE STRUCTURAL CANDIDATE FOUND" -ForegroundColor Yellow
    Write-Host " RETURN EVIDENCE BEFORE SOURCE MUTATION" -ForegroundColor Yellow
    Write-Host "======================================================================" -ForegroundColor Yellow
} else {
    Write-Host "======================================================================" -ForegroundColor Red
    Write-Host " R6-G0 RD2 STOP / SOURCE IDENTITY UNRESOLVED" -ForegroundColor Red
    Write-Host " RETURN INVENTORY FOR NEXT MATERIAL INVESTIGATION" -ForegroundColor Red
    Write-Host "======================================================================" -ForegroundColor Red
}
Write-Host ("REPORT   : " + $ReportPath)
Write-Host ("EVIDENCE : " + $EvidencePath)
