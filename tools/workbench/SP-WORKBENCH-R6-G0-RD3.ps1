$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

# Signalproof Workbench GUI RD2 R6 - G0 RD3
# Exact R5.1 source recovery from provenance-bound builder/package identities.
# Read-only against existing artifacts. Writes only to a fresh evidence lane.
# No compile, no production mutation, no ACL changes, no registration changes,
# no Governor/Core mutation, no model/provider/tool execution.

$EvidenceRoot = "F:\Downloads\Quarantine\Evidence"
$OutputDir = Join-Path $EvidenceRoot "SP-WORKBENCH-R6-G0-EV-RD3"
$RecoveredDir = Join-Path $OutputDir "recovered"
$ExtractDir = Join-Path $OutputDir "package-extract"
$ReportPath = Join-Path $OutputDir "R6-G0-RD3-RECOVERY-REPORT.txt"
$EvidencePath = Join-Path $OutputDir "R6-G0-RD3-RECOVERY-EVIDENCE.json"
$RecoveredSource = Join-Path $RecoveredDir "SignalproofWorkbenchGuiRd2-R5.1-RECOVERED.cs"

$ExpectedSourceSha = "B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12"
$ExpectedH1BuilderSha = "D462707C7323E8D714109532F445734ED581115B773E6515232EE28E7A0236FA"
$ExpectedH1ZipSha = "A89CBBC62E3C0061160D25F9A2E2322B3A8B03804210A030F10CD8EABCE3D74F"
$ExpectedR51BuilderSha = "AA3462EA46586585E30FF06B285CEA057E4FB97237AEA63C81FBC447F7E6DCE7"
$ExpectedR51ZipSha = "FF4FD88016DF1798FB9BD0EDA26E70EF446FD3BE60A23CC82B94BE6A498AA558"

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

function Get-ContextHits {
    param([string[]]$Lines,[string[]]$Patterns)
    $Hits = New-Object System.Collections.Generic.List[object]
    for ($i = 0; $i -lt $Lines.Length; $i++) {
        foreach ($Pattern in $Patterns) {
            if ($Lines[$i].IndexOf($Pattern,[System.StringComparison]::OrdinalIgnoreCase) -ge 0) {
                $Start = [Math]::Max(0,$i - 4)
                $End = [Math]::Min($Lines.Length - 1,$i + 8)
                $Context = New-Object System.Collections.Generic.List[string]
                for ($j = $Start; $j -le $End; $j++) {
                    [void]$Context.Add(("{0}: {1}" -f ($j + 1),$Lines[$j]))
                }
                [void]$Hits.Add([pscustomobject]@{
                    pattern = $Pattern
                    line = $i + 1
                    context = @($Context)
                })
                break
            }
        }
    }
    return @($Hits)
}

# Exact-final self parser preflight before any write.
$Tokens = $null
$Errors = $null
[System.Management.Automation.Language.Parser]::ParseFile($PSCommandPath,[ref]$Tokens,[ref]$Errors) | Out-Null
if ($null -ne $Errors -and @($Errors).Count -gt 0) {
    $Errors | ForEach-Object {
        Write-Host ("LINE " + $_.Extent.StartLineNumber + ": " + $_.Message) -ForegroundColor Red
    }
    throw "STOP: exact-final R6-G0 RD3 parser preflight failed."
}

$SelfSha = Get-Sha256Upper $PSCommandPath

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD3" -ForegroundColor Cyan
Write-Host " EXACT R5.1 SOURCE RECOVERY FROM BUILDER / PACKAGE LINEAGE" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ("RUNNER SHA256 : " + $SelfSha)

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)
$IsAdmin = $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Pass-R6 (-not $IsAdmin) "normal non-elevated owner"
Pass-R6 (-not (Test-Path -LiteralPath $OutputDir)) "fresh RD3 evidence lane absent"
Pass-R6 (Test-Path -LiteralPath $ProductionExe -PathType Leaf) "production Workbench exists"
Pass-R6 ((Get-Sha256Upper $ProductionExe) -eq $ExpectedProductionExeSha) "production Workbench protected identity exact"

$SearchRoots = New-Object System.Collections.Generic.List[string]
foreach ($Root in @(
    $EvidenceRoot,
    "F:\Downloads",
    (Join-Path $env:USERPROFILE "Downloads")
)) {
    if ((Test-Path -LiteralPath $Root -PathType Container) -and -not $SearchRoots.Contains($Root)) {
        [void]$SearchRoots.Add($Root)
    }
}

Write-Host ""
Write-Host "=== 1. LOCATE PROVENANCE-BOUND BUILDERS / PACKAGES ===" -ForegroundColor Cyan

$NameFragments = @(
    "Signalproof-Workbench-GUI-RD2-R5.1",
    "Workbench-GUI-RD2-R5.1",
    "R5.1-H1",
    "R5.1-DETERMINISTIC",
    "SELF-TEST-FIX"
)

$CandidateFiles = New-Object System.Collections.Generic.List[object]
$SeenPaths = @{}

foreach ($Root in $SearchRoots) {
    Write-Host ("SEARCH ROOT: " + $Root)
    $Files = @()
    try {
        $Files = @(
            Get-ChildItem -LiteralPath $Root -File -Recurse -ErrorAction SilentlyContinue |
            Where-Object {
                ($_.Extension -ieq ".ps1" -or $_.Extension -ieq ".zip") -and
                (
                    $_.Name.IndexOf("Workbench",[System.StringComparison]::OrdinalIgnoreCase) -ge 0 -or
                    $_.Name.IndexOf("R5.1",[System.StringComparison]::OrdinalIgnoreCase) -ge 0
                )
            }
        )
    }
    catch {}

    foreach ($File in $Files) {
        $Canonical = $File.FullName.ToLowerInvariant()
        if ($SeenPaths.ContainsKey($Canonical)) { continue }
        $SeenPaths[$Canonical] = $true

        $Hash = Get-Sha256Upper $File.FullName
        $Kind = "OTHER"
        if ($Hash -eq $ExpectedH1BuilderSha) { $Kind = "H1_BUILDER_EXACT" }
        elseif ($Hash -eq $ExpectedH1ZipSha) { $Kind = "H1_ZIP_EXACT" }
        elseif ($Hash -eq $ExpectedR51BuilderSha) { $Kind = "R51_BUILDER_EXACT" }
        elseif ($Hash -eq $ExpectedR51ZipSha) { $Kind = "R51_ZIP_EXACT" }

        $Row = [pscustomobject]@{
            path = $File.FullName
            sha256 = $Hash
            bytes = $File.Length
            kind = $Kind
        }
        [void]$CandidateFiles.Add($Row)

        if ($Kind -ne "OTHER") {
            Write-Host ("FOUND " + $Kind + ": " + $File.FullName) -ForegroundColor Green
        }
    }
}

$ExactArtifacts = @($CandidateFiles | Where-Object { $_.kind -ne "OTHER" } | Sort-Object kind,path)
Pass-R6 ($ExactArtifacts.Count -gt 0) "one or more exact R5.1/H1 builder or package identities located"

New-Item -ItemType Directory -Path $OutputDir -ErrorAction Stop | Out-Null
New-Item -ItemType Directory -Path $RecoveredDir -ErrorAction Stop | Out-Null
New-Item -ItemType Directory -Path $ExtractDir -ErrorAction Stop | Out-Null

$RecoveryCandidates = New-Object System.Collections.Generic.List[object]

function Add-RecoveryBytes {
    param(
        [byte[]]$Bytes,
        [string]$Origin,
        [string]$Method
    )

    if ($null -eq $Bytes -or $Bytes.Length -eq 0) { return }

    $ShaObj = [System.Security.Cryptography.SHA256]::Create()
    try {
        $HashBytes = $ShaObj.ComputeHash($Bytes)
    }
    finally {
        $ShaObj.Dispose()
    }
    $Hash = ([BitConverter]::ToString($HashBytes)).Replace("-","").ToUpperInvariant()

    if ($Hash -eq $ExpectedSourceSha) {
        [void]$RecoveryCandidates.Add([pscustomobject]@{
            origin = $Origin
            method = $Method
            sha256 = $Hash
            bytes = $Bytes.Length
            payload = $Bytes
        })
        Write-Host ("PASS: exact R5.1 GUI source recovered via " + $Method + " from " + $Origin) -ForegroundColor Green
    }
}

function Inspect-BuilderForSource {
    param([string]$BuilderPath)

    $Raw = [System.IO.File]::ReadAllText($BuilderPath,[System.Text.Encoding]::UTF8)

    # Inspect long quoted Base64 strings. Exact source SHA is the only acceptance authority.
    $Regex = New-Object System.Text.RegularExpressions.Regex(
        '"([A-Za-z0-9+/=]{256,})"',
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )
    $Matches = $Regex.Matches($Raw)
    foreach ($Match in $Matches) {
        $Value = $Match.Groups[1].Value
        try {
            $Bytes = [Convert]::FromBase64String($Value)
            Add-RecoveryBytes $Bytes $BuilderPath "embedded-base64"
        }
        catch {}
    }
}

Write-Host ""
Write-Host "=== 2. RECOVER EXACT SOURCE BY SHA ===" -ForegroundColor Cyan

foreach ($Artifact in $ExactArtifacts) {
    if ([System.IO.Path]::GetExtension([string]$Artifact.path) -ieq ".ps1") {
        Inspect-BuilderForSource ([string]$Artifact.path)
        continue
    }

    if ([System.IO.Path]::GetExtension([string]$Artifact.path) -ieq ".zip") {
        $ZipLane = Join-Path $ExtractDir ([string]$Artifact.kind)
        if (-not (Test-Path -LiteralPath $ZipLane)) {
            New-Item -ItemType Directory -Path $ZipLane -ErrorAction Stop | Out-Null
        }

        Expand-Archive -LiteralPath ([string]$Artifact.path) -DestinationPath $ZipLane -Force

        $CsFiles = @(Get-ChildItem -LiteralPath $ZipLane -File -Recurse -Filter *.cs -ErrorAction SilentlyContinue)
        foreach ($Cs in $CsFiles) {
            if ((Get-Sha256Upper $Cs.FullName) -eq $ExpectedSourceSha) {
                Add-RecoveryBytes ([System.IO.File]::ReadAllBytes($Cs.FullName)) $Cs.FullName "exact-cs-in-package"
            }
        }

        $PsFiles = @(Get-ChildItem -LiteralPath $ZipLane -File -Recurse -Filter *.ps1 -ErrorAction SilentlyContinue)
        foreach ($Ps in $PsFiles) {
            Inspect-BuilderForSource $Ps.FullName
        }
    }
}

$ExactRecovered = @($RecoveryCandidates | Where-Object { $_.sha256 -eq $ExpectedSourceSha })
Pass-R6 ($ExactRecovered.Count -gt 0) "exact R5.1 GUI source bytes recovered"

# All accepted recovery candidates have the same exact bytes by SHA. Save one deterministic copy.
$Selected = @($ExactRecovered | Sort-Object origin,method)[0]
[System.IO.File]::WriteAllBytes($RecoveredSource,[byte[]]$Selected.payload)
Pass-R6 ((Get-Sha256Upper $RecoveredSource) -eq $ExpectedSourceSha) "recovered source file identity exact"

Write-Host ""
Write-Host "=== 3. VERIFY R5.1 STRUCTURAL CONTRACT ===" -ForegroundColor Cyan

$SourceText = [System.IO.File]::ReadAllText($RecoveredSource,[System.Text.Encoding]::UTF8)
$Checks = [ordered]@{
    richtextbox = ($SourceText.IndexOf("RichTextBox",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
    wm_vscroll = ($SourceText.IndexOf("WM_VSCROLL",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
    sb_bottom = ($SourceText.IndexOf("SB_BOTTOM",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
    native_bottom_marker = ($SourceText.IndexOf("transcript_native_bottom_scroll",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
    overlap_marker = ($SourceText.IndexOf("composer_overlap_prevented",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
    governor_pipe = ($SourceText.IndexOf("Signalproof.Governor.Request.v1",[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
    direct_ollama_absent = ($SourceText.IndexOf("127.0.0.1:11434",[System.StringComparison]::OrdinalIgnoreCase) -lt 0)
    process_start_absent = ($SourceText.IndexOf("Process.Start",[System.StringComparison]::OrdinalIgnoreCase) -lt 0)
    session_surface = (
        $SourceText.IndexOf("CreateSession",[System.StringComparison]::OrdinalIgnoreCase) -ge 0 -or
        $SourceText.IndexOf("DeleteSession",[System.StringComparison]::OrdinalIgnoreCase) -ge 0
    )
    bot_surface = (
        $SourceText.IndexOf("CreateBot",[System.StringComparison]::OrdinalIgnoreCase) -ge 0 -or
        $SourceText.IndexOf("DeleteBot",[System.StringComparison]::OrdinalIgnoreCase) -ge 0
    )
}

Pass-R6 ([bool]$Checks.richtextbox) "RichTextBox transcript architecture present"
Pass-R6 ([bool]$Checks.wm_vscroll) "native WM_VSCROLL path present"
Pass-R6 ([bool]$Checks.sb_bottom) "native SB_BOTTOM path present"
Pass-R6 ([bool]$Checks.native_bottom_marker) "R5.1 native bottom self-test marker present"
Pass-R6 ([bool]$Checks.overlap_marker) "R5.1 composer separation marker present"
Pass-R6 ([bool]$Checks.governor_pipe) "Governor request pipe contract present"
Pass-R6 ([bool]$Checks.direct_ollama_absent) "direct Ollama endpoint absent"
Pass-R6 ([bool]$Checks.process_start_absent) "direct Process.Start absent"
Pass-R6 ([bool]$Checks.session_surface) "Session surface markers present"
Pass-R6 ([bool]$Checks.bot_surface) "Bot surface markers present"

Write-Host ""
Write-Host "=== 4. LOCALIZE R6-G1 PATCH SURFACES ===" -ForegroundColor Cyan

$Lines = [System.IO.File]::ReadAllLines($RecoveredSource,[System.Text.Encoding]::UTF8)
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
    "Signalproof.Governor.Request.v1",
    "AssemblyVersion",
    "AssemblyFileVersion",
    "Version",
    "Governed AI workspace",
    "Control / Evidence",
    "Context",
    "Send"
)
$Hits = @(Get-ContextHits $Lines $Patterns)
Pass-R6 ($Hits.Count -gt 0) "R6-G1 localization contexts captured"

$ReportBuilder = New-Object System.Text.StringBuilder
[void]$ReportBuilder.AppendLine("SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 RD3")
[void]$ReportBuilder.AppendLine(("Runner SHA256: " + $SelfSha))
[void]$ReportBuilder.AppendLine(("Recovered source: " + $RecoveredSource))
[void]$ReportBuilder.AppendLine(("Recovered source SHA256: " + (Get-Sha256Upper $RecoveredSource)))
[void]$ReportBuilder.AppendLine(("Exact lineage artifacts found: " + $ExactArtifacts.Count))
[void]$ReportBuilder.AppendLine(("Exact source recovery instances: " + $ExactRecovered.Count))
[void]$ReportBuilder.AppendLine("")
[void]$ReportBuilder.AppendLine("EXACT LINEAGE ARTIFACTS")
foreach ($Artifact in $ExactArtifacts) {
    [void]$ReportBuilder.AppendLine(("[{0}] {1} {2}" -f $Artifact.kind,$Artifact.sha256,$Artifact.path))
}
[void]$ReportBuilder.AppendLine("")
[void]$ReportBuilder.AppendLine("LOCALIZATION CONTEXTS")
foreach ($Hit in $Hits) {
    [void]$ReportBuilder.AppendLine("")
    [void]$ReportBuilder.AppendLine(("PATTERN: " + $Hit.pattern + " | LINE " + $Hit.line))
    foreach ($ContextLine in @($Hit.context)) {
        [void]$ReportBuilder.AppendLine($ContextLine)
    }
}
Write-Utf8NoBom $ReportPath $ReportBuilder.ToString()

# Do not serialize raw source bytes into evidence.
$RecoveryEvidence = @()
foreach ($Item in $ExactRecovered) {
    $RecoveryEvidence += [pscustomobject]@{
        origin = $Item.origin
        method = $Item.method
        sha256 = $Item.sha256
        bytes = $Item.bytes
    }
}

$Evidence = [ordered]@{
    schema = "signalproof.workbench.r6.g0.rd3.source-recovery.v1"
    runner_sha256 = $SelfSha
    user = $Identity.Name
    is_admin = $IsAdmin
    production_exe_sha256 = Get-Sha256Upper $ProductionExe
    expected_source_sha256 = $ExpectedSourceSha
    lineage_artifacts = @($ExactArtifacts)
    recovery_instances = @($RecoveryEvidence)
    recovered_source_path = $RecoveredSource
    recovered_source_sha256 = Get-Sha256Upper $RecoveredSource
    structural_checks = $Checks
    localization_hit_count = $Hits.Count
    disposition = "PASS_EXACT_R5.1_SOURCE_RECOVERED_AND_LOCALIZED"
    next_gate = "R6-G1 UX HOUSEKEEPING + VERSION LEGIBILITY + CODE ARTIFACT WORKSPACE"
}
$Json = $Evidence | ConvertTo-Json -Depth 8
Write-Utf8NoBom $EvidencePath $Json

Pass-R6 (Test-Path -LiteralPath $ReportPath -PathType Leaf) "RD3 recovery report written"
Pass-R6 (Test-Path -LiteralPath $EvidencePath -PathType Leaf) "RD3 recovery JSON written"

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Green
Write-Host " R6-G0 RD3 PASS / EXACT R5.1 SOURCE RECOVERED AND LOCALIZED" -ForegroundColor Green
Write-Host " NEXT: R6-G1 UX + VERSION + CODE ARTIFACT WORKSPACE BUILD" -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Green
Write-Host ("RECOVERED SOURCE : " + $RecoveredSource)
Write-Host ("SOURCE SHA256    : " + (Get-Sha256Upper $RecoveredSource))
Write-Host ("REPORT           : " + $ReportPath)
Write-Host ("EVIDENCE         : " + $EvidencePath)
Write-Host ""
Write-Host "COPY/PASTE THE CONSOLE RESULT AND REPORT CONTENT INTO THE WORK CHAT." -ForegroundColor Cyan
