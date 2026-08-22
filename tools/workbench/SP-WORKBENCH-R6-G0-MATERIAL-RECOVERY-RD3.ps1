$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

# Signalproof Workbench GUI RD2 R6
# R6-G0 AUTHORITATIVE BUILD-MATERIAL RECOVERY RD3
# Read-only discovery across F:\Downloads\Quarantine\Evidence.
# Writes only a fresh evidence lane. No production/Governor/Core/ACL/canonical-ledger mutation.

$EvidenceRoot = "F:\Downloads\Quarantine\Evidence"
$OutputDir = Join-Path $EvidenceRoot "SP-WORKBENCH-R6-G0-RECOVERY-EV-RD3"
$ReportPath = Join-Path $OutputDir "R6-G0-AUTHORITATIVE-MATERIAL-RECOVERY.txt"
$JsonPath = Join-Path $OutputDir "R6-G0-AUTHORITATIVE-MATERIAL-RECOVERY.json"
$RecoveredSourcePath = Join-Path $OutputDir "R6-G0-RECOVERED-SOURCE.cs"
$RecoveredBuilderPath = Join-Path $OutputDir "R6-G0-RECOVERED-H1-BUILDER.ps1"
$RecoveredPackagePath = Join-Path $OutputDir "R6-G0-RECOVERED-H1-PACKAGE.zip"

$HistoricalSourceSha = "B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12"
$H1BuilderSha = "D462707C7323E8D714109532F445734ED581115B773E6515232EE28E7A0236FA"
$H1PackageSha = "A89CBBC62E3C0061160D25F9A2E2322B3A8B03804210A030F10CD8EABCE3D74F"
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
function Get-ByteSha256Upper([byte[]]$Bytes) {
    $Hasher = [System.Security.Cryptography.SHA256]::Create()
    try {
        $Hash = $Hasher.ComputeHash($Bytes)
        return (($Hash | ForEach-Object { $_.ToString("x2") }) -join "").ToUpperInvariant()
    }
    finally { $Hasher.Dispose() }
}
function Has-Text([string]$Text,[string]$Needle) {
    return ($Text.IndexOf($Needle,[System.StringComparison]::OrdinalIgnoreCase) -ge 0)
}
function Get-StructuralScore([string]$Text) {
    $Score = 0
    if (Has-Text $Text "RichTextBox") { $Score += 2 }
    if (Has-Text $Text "Signalproof.Governor.Request.v1") { $Score += 4 }
    if (Has-Text $Text "CreateSession") { $Score += 1 }
    if (Has-Text $Text "DeleteSession") { $Score += 2 }
    if (Has-Text $Text "CreateBot") { $Score += 1 }
    if (Has-Text $Text "DeleteBot") { $Score += 2 }
    if (Has-Text $Text "transcript_native_bottom_scroll") { $Score += 3 }
    if (Has-Text $Text "composer_overlap_prevented") { $Score += 3 }
    if (Has-Text $Text "transcript_follow_timer") { $Score += 1 }
    if (-not (Has-Text $Text "127.0.0.1:11434")) { $Score += 2 }
    if (-not (Has-Text $Text "Process.Start")) { $Score += 2 }
    if (-not (Has-Text $Text "FlowLayoutPanel transcript")) { $Score += 1 }
    return $Score
}
function Write-Utf8NoBom([string]$Path,[string]$Text) {
    [System.IO.File]::WriteAllText($Path,$Text,(New-Object System.Text.UTF8Encoding($false)))
}
function Copy-Exact([string]$Source,[string]$Destination,[string]$ExpectedSha) {
    [System.IO.File]::Copy($Source,$Destination,$false)
    if ((Get-Sha256Upper $Destination) -ne $ExpectedSha) { Stop-R6 ("recovery copy hash mismatch: " + $Destination) }
}
function Read-ZipEntryBytes($Entry) {
    $Stream = $Entry.Open()
    try {
        $Memory = New-Object System.IO.MemoryStream
        try {
            $Stream.CopyTo($Memory)
            return [byte[]]$Memory.ToArray()
        }
        finally { $Memory.Dispose() }
    }
    finally { $Stream.Dispose() }
}

$SelfTokens = $null
$SelfErrors = $null
[System.Management.Automation.Language.Parser]::ParseFile($PSCommandPath,[ref]$SelfTokens,[ref]$SelfErrors) | Out-Null
if ($null -ne $SelfErrors -and @($SelfErrors).Count -gt 0) {
    $SelfErrors | ForEach-Object { Write-Host ("LINE {0}, COL {1}: {2}" -f $_.Extent.StartLineNumber,$_.Extent.StartColumnNumber,$_.Message) -ForegroundColor Red }
    Stop-R6 "exact-final RD3 parser preflight failed"
}

$SelfSha = Get-Sha256Upper $PSCommandPath
Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 MATERIAL RECOVERY RD3" -ForegroundColor Cyan
Write-Host " AUTHORITATIVE SOURCE / BUILDER / PACKAGE DISCOVERY" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ("RUNNER SHA256 : " + $SelfSha)

$Identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$Principal = New-Object Security.Principal.WindowsPrincipal($Identity)
$IsAdmin = $Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
Pass-R6 (-not $IsAdmin) "runs as normal non-elevated owner"
Pass-R6 (-not (Test-Path -LiteralPath $OutputDir)) "fresh RD3 evidence lane absent"
Pass-R6 (Test-Path -LiteralPath $EvidenceRoot -PathType Container) "Quarantine Evidence root exists"
Pass-R6 (Test-Path -LiteralPath $ProductionExe -PathType Leaf) "production Workbench exists"
Pass-R6 ((Get-Sha256Upper $ProductionExe) -eq $ExpectedProductionExeSha) "production Workbench protected identity exact"

$ExactSourceFiles = New-Object System.Collections.Generic.List[string]
$ExactBuilderFiles = New-Object System.Collections.Generic.List[string]
$ExactPackageFiles = New-Object System.Collections.Generic.List[string]
$StructuralLooseFiles = New-Object System.Collections.Generic.List[object]
$ZipSourceHits = New-Object System.Collections.Generic.List[object]
$ZipBuilderHits = New-Object System.Collections.Generic.List[object]
$ZipInventory = New-Object System.Collections.Generic.List[object]

Write-Host ""
Write-Host "=== 1. LOOSE-FILE IDENTITY SEARCH ===" -ForegroundColor Cyan
$LooseCs = @(Get-ChildItem -LiteralPath $EvidenceRoot -File -Filter *.cs -Recurse -ErrorAction SilentlyContinue)
Write-Host ("Loose .cs files found: " + $LooseCs.Count)
foreach ($File in $LooseCs) {
    try {
        $Sha = Get-Sha256Upper $File.FullName
        if ($Sha -eq $HistoricalSourceSha) {
            [void]$ExactSourceFiles.Add($File.FullName)
            Write-Host ("EXACT SOURCE: " + $File.FullName) -ForegroundColor Green
        }
        else {
            $Text = [System.IO.File]::ReadAllText($File.FullName,[System.Text.Encoding]::UTF8)
            $Score = Get-StructuralScore $Text
            if ($Score -ge 17) { [void]$StructuralLooseFiles.Add([pscustomobject]@{ path=$File.FullName; sha256=$Sha; score=$Score }) }
        }
    }
    catch { Write-Host ("WARN C#: " + $File.FullName + " :: " + $_.Exception.Message) -ForegroundColor Yellow }
}

$LoosePs1 = @(Get-ChildItem -LiteralPath $EvidenceRoot -File -Filter *.ps1 -Recurse -ErrorAction SilentlyContinue)
Write-Host ("Loose .ps1 files found: " + $LoosePs1.Count)
foreach ($File in $LoosePs1) {
    try {
        $Sha = Get-Sha256Upper $File.FullName
        if ($Sha -eq $H1BuilderSha) { [void]$ExactBuilderFiles.Add($File.FullName); Write-Host ("EXACT H1 BUILDER: " + $File.FullName) -ForegroundColor Green }
    }
    catch { Write-Host ("WARN PS1: " + $File.FullName + " :: " + $_.Exception.Message) -ForegroundColor Yellow }
}

$LooseZip = @(Get-ChildItem -LiteralPath $EvidenceRoot -File -Filter *.zip -Recurse -ErrorAction SilentlyContinue)
Write-Host ("Loose .zip files found: " + $LooseZip.Count)
foreach ($File in $LooseZip) {
    try {
        $Sha = Get-Sha256Upper $File.FullName
        if ($Sha -eq $H1PackageSha) { [void]$ExactPackageFiles.Add($File.FullName); Write-Host ("EXACT H1 PACKAGE: " + $File.FullName) -ForegroundColor Green }
    }
    catch { Write-Host ("WARN ZIP HASH: " + $File.FullName + " :: " + $_.Exception.Message) -ForegroundColor Yellow }
}

Write-Host ""
Write-Host "=== 2. ZIP-ENTRY SOURCE / BUILDER SEARCH ===" -ForegroundColor Cyan
Add-Type -AssemblyName System.IO.Compression.FileSystem
$ZipCandidates = New-Object System.Collections.Generic.List[string]
foreach ($P in $ExactPackageFiles) { if (-not $ZipCandidates.Contains($P)) { [void]$ZipCandidates.Add($P) } }
foreach ($File in $LooseZip) {
    if ($File.Name -match '(?i)(workbench|wb|r5\.1|r5|agent-console)') {
        if (-not $ZipCandidates.Contains($File.FullName)) { [void]$ZipCandidates.Add($File.FullName) }
    }
}
Write-Host ("ZIP candidates to inspect: " + $ZipCandidates.Count)

foreach ($ZipPath in $ZipCandidates) {
    $Archive = $null
    try {
        $Archive = [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
        $CsCount = 0
        $Ps1Count = 0
        foreach ($Entry in $Archive.Entries) {
            if ([string]::IsNullOrEmpty($Entry.Name)) { continue }
            $Extension = [System.IO.Path]::GetExtension($Entry.Name)
            if ($Extension -ieq ".cs") {
                $CsCount++
                $Bytes = Read-ZipEntryBytes $Entry
                $Sha = Get-ByteSha256Upper $Bytes
                $Text = [System.Text.Encoding]::UTF8.GetString($Bytes)
                $Score = Get-StructuralScore $Text
                if ($Sha -eq $HistoricalSourceSha -or $Score -ge 17) {
                    [void]$ZipSourceHits.Add([pscustomobject]@{ zip=$ZipPath; entry=$Entry.FullName; sha256=$Sha; exact_historical_source=($Sha -eq $HistoricalSourceSha); score=$Score })
                    Write-Host ("ZIP SOURCE HIT score={0} exact={1} :: {2} :: {3}" -f $Score,($Sha -eq $HistoricalSourceSha),$ZipPath,$Entry.FullName) -ForegroundColor Green
                }
            }
            elseif ($Extension -ieq ".ps1") {
                $Ps1Count++
                $Bytes = Read-ZipEntryBytes $Entry
                $Sha = Get-ByteSha256Upper $Bytes
                if ($Sha -eq $H1BuilderSha) {
                    [void]$ZipBuilderHits.Add([pscustomobject]@{ zip=$ZipPath; entry=$Entry.FullName; sha256=$Sha })
                    Write-Host ("ZIP H1 BUILDER HIT: " + $ZipPath + " :: " + $Entry.FullName) -ForegroundColor Green
                }
            }
        }
        [void]$ZipInventory.Add([pscustomobject]@{ zip=$ZipPath; cs_entries=$CsCount; ps1_entries=$Ps1Count })
    }
    catch { Write-Host ("WARN ZIP INSPECT: " + $ZipPath + " :: " + $_.Exception.Message) -ForegroundColor Yellow }
    finally { if ($null -ne $Archive) { $Archive.Dispose() } }
}

Write-Host ""
Write-Host "=== 3. SELECT STRONGEST AUTHORITATIVE MATERIAL ===" -ForegroundColor Cyan
Write-Host ("Exact loose source matches : " + $ExactSourceFiles.Count)
Write-Host ("Exact loose H1 builders   : " + $ExactBuilderFiles.Count)
Write-Host ("Exact H1 packages         : " + $ExactPackageFiles.Count)
Write-Host ("Structural loose sources  : " + $StructuralLooseFiles.Count)
Write-Host ("ZIP source hits           : " + $ZipSourceHits.Count)
Write-Host ("ZIP H1 builder hits       : " + $ZipBuilderHits.Count)

New-Item -ItemType Directory -Path $OutputDir -ErrorAction Stop | Out-Null
$SelectedSourceKind = ""
$SelectedSourceOrigin = ""
$SelectedSourceSha = ""
$SelectedSourceScore = 0
$SelectedBuilderOrigin = ""
$SelectedPackageOrigin = ""

if ($ExactSourceFiles.Count -eq 1) {
    $SelectedSourceKind = "exact_loose_source"
    $SelectedSourceOrigin = $ExactSourceFiles[0]
    $SelectedSourceSha = $HistoricalSourceSha
    Copy-Exact $SelectedSourceOrigin $RecoveredSourcePath $HistoricalSourceSha
}
else {
    $ExactZipSources = @($ZipSourceHits | Where-Object { $_.exact_historical_source })
    if ($ExactZipSources.Count -eq 1) {
        $Hit = $ExactZipSources[0]
        $Archive = [System.IO.Compression.ZipFile]::OpenRead($Hit.zip)
        try {
            $Entry = $Archive.GetEntry($Hit.entry)
            if ($null -eq $Entry) { Stop-R6 "selected ZIP source entry disappeared" }
            [System.IO.File]::WriteAllBytes($RecoveredSourcePath,(Read-ZipEntryBytes $Entry))
        }
        finally { $Archive.Dispose() }
        Pass-R6 ((Get-Sha256Upper $RecoveredSourcePath) -eq $HistoricalSourceSha) "recovered ZIP source exact historical SHA256"
        $SelectedSourceKind = "exact_zip_source"
        $SelectedSourceOrigin = ($Hit.zip + " :: " + $Hit.entry)
        $SelectedSourceSha = $HistoricalSourceSha
        $SelectedSourceScore = $Hit.score
    }
}

if ([string]::IsNullOrEmpty($SelectedSourceKind)) {
    $StructuralCandidates = New-Object System.Collections.Generic.List[object]
    foreach ($Item in $StructuralLooseFiles) { [void]$StructuralCandidates.Add($Item) }
    foreach ($Item in $ZipSourceHits) {
        if (-not $Item.exact_historical_source) { [void]$StructuralCandidates.Add([pscustomobject]@{ path=($Item.zip + " :: " + $Item.entry); sha256=$Item.sha256; score=$Item.score; zip=$Item.zip; entry=$Item.entry }) }
    }
    if ($StructuralCandidates.Count -gt 0) {
        $Sorted = @($StructuralCandidates | Sort-Object -Property @{Expression='score';Descending=$true}, @{Expression='path';Descending=$false})
        $TopScore = $Sorted[0].score
        $Top = @($Sorted | Where-Object { $_.score -eq $TopScore })
        if ($Top.Count -eq 1) {
            $Candidate = $Top[0]
            if ($Candidate.PSObject.Properties["zip"] -and $Candidate.zip) {
                $Archive = [System.IO.Compression.ZipFile]::OpenRead($Candidate.zip)
                try {
                    $Entry = $Archive.GetEntry($Candidate.entry)
                    if ($null -eq $Entry) { Stop-R6 "selected structural ZIP entry disappeared" }
                    [System.IO.File]::WriteAllBytes($RecoveredSourcePath,(Read-ZipEntryBytes $Entry))
                }
                finally { $Archive.Dispose() }
            }
            else { [System.IO.File]::Copy($Candidate.path,$RecoveredSourcePath,$false) }
            $SelectedSourceKind = "unique_top_structural_source"
            $SelectedSourceOrigin = $Candidate.path
            $SelectedSourceSha = Get-Sha256Upper $RecoveredSourcePath
            $SelectedSourceScore = $Candidate.score
        }
    }
}

if ($ExactBuilderFiles.Count -eq 1) {
    Copy-Exact $ExactBuilderFiles[0] $RecoveredBuilderPath $H1BuilderSha
    $SelectedBuilderOrigin = $ExactBuilderFiles[0]
}
elseif ($ZipBuilderHits.Count -eq 1) {
    $Hit = $ZipBuilderHits[0]
    $Archive = [System.IO.Compression.ZipFile]::OpenRead($Hit.zip)
    try {
        $Entry = $Archive.GetEntry($Hit.entry)
        if ($null -eq $Entry) { Stop-R6 "selected ZIP H1 builder entry disappeared" }
        [System.IO.File]::WriteAllBytes($RecoveredBuilderPath,(Read-ZipEntryBytes $Entry))
    }
    finally { $Archive.Dispose() }
    Pass-R6 ((Get-Sha256Upper $RecoveredBuilderPath) -eq $H1BuilderSha) "recovered H1 builder exact SHA256"
    $SelectedBuilderOrigin = ($Hit.zip + " :: " + $Hit.entry)
}

if ($ExactPackageFiles.Count -eq 1) {
    Copy-Exact $ExactPackageFiles[0] $RecoveredPackagePath $H1PackageSha
    $SelectedPackageOrigin = $ExactPackageFiles[0]
}

$Disposition = "STOP_NO_AUTHORITATIVE_BUILD_MATERIAL"
if (-not [string]::IsNullOrEmpty($SelectedSourceKind)) { $Disposition = "PASS_SOURCE_RECOVERED" }
elseif (-not [string]::IsNullOrEmpty($SelectedBuilderOrigin)) { $Disposition = "PASS_BUILDER_RECOVERED_SOURCE_REGEN_REQUIRED" }
elseif (-not [string]::IsNullOrEmpty($SelectedPackageOrigin)) { $Disposition = "PASS_PACKAGE_RECOVERED_DEEP_INSPECTION_REQUIRED" }

$Evidence = [ordered]@{
    schema="signalproof.workbench.r6.g0.authoritative-material-recovery.v3"; disposition=$Disposition; runner_sha256=$SelfSha; evidence_root=$EvidenceRoot;
    production_exe_sha256=(Get-Sha256Upper $ProductionExe); historical_source_sha256=$HistoricalSourceSha; h1_builder_sha256=$H1BuilderSha; h1_package_sha256=$H1PackageSha;
    exact_loose_source_matches=[string[]]$ExactSourceFiles.ToArray(); exact_loose_builder_matches=[string[]]$ExactBuilderFiles.ToArray(); exact_package_matches=[string[]]$ExactPackageFiles.ToArray();
    structural_loose_sources=[object[]]$StructuralLooseFiles.ToArray(); zip_source_hits=[object[]]$ZipSourceHits.ToArray(); zip_builder_hits=[object[]]$ZipBuilderHits.ToArray(); zip_inventory=[object[]]$ZipInventory.ToArray();
    selected_source_kind=$SelectedSourceKind; selected_source_origin=$SelectedSourceOrigin; selected_source_sha256=$SelectedSourceSha; selected_source_score=$SelectedSourceScore;
    selected_builder_origin=$SelectedBuilderOrigin; selected_package_origin=$SelectedPackageOrigin;
    recovered_source_path=$(if (Test-Path -LiteralPath $RecoveredSourcePath -PathType Leaf) { $RecoveredSourcePath } else { $null });
    recovered_builder_path=$(if (Test-Path -LiteralPath $RecoveredBuilderPath -PathType Leaf) { $RecoveredBuilderPath } else { $null });
    recovered_package_path=$(if (Test-Path -LiteralPath $RecoveredPackagePath -PathType Leaf) { $RecoveredPackagePath } else { $null })
}
Write-Utf8NoBom $JsonPath ($Evidence | ConvertTo-Json -Depth 8)

$Report = New-Object System.Text.StringBuilder
[void]$Report.AppendLine("SIGNALPROOF WORKBENCH GUI RD2 R6 - G0 AUTHORITATIVE MATERIAL RECOVERY RD3")
[void]$Report.AppendLine(("Runner SHA256: " + $SelfSha))
[void]$Report.AppendLine(("Disposition: " + $Disposition))
[void]$Report.AppendLine(("Exact loose source matches: " + $ExactSourceFiles.Count))
[void]$Report.AppendLine(("Exact loose H1 builder matches: " + $ExactBuilderFiles.Count))
[void]$Report.AppendLine(("Exact H1 package matches: " + $ExactPackageFiles.Count))
[void]$Report.AppendLine(("Structural loose sources: " + $StructuralLooseFiles.Count))
[void]$Report.AppendLine(("ZIP source hits: " + $ZipSourceHits.Count))
[void]$Report.AppendLine(("ZIP H1 builder hits: " + $ZipBuilderHits.Count))
[void]$Report.AppendLine("")
[void]$Report.AppendLine(("Selected source kind: " + $SelectedSourceKind))
[void]$Report.AppendLine(("Selected source origin: " + $SelectedSourceOrigin))
[void]$Report.AppendLine(("Selected source SHA256: " + $SelectedSourceSha))
[void]$Report.AppendLine(("Selected source structural score: " + $SelectedSourceScore))
[void]$Report.AppendLine(("Selected H1 builder origin: " + $SelectedBuilderOrigin))
[void]$Report.AppendLine(("Selected H1 package origin: " + $SelectedPackageOrigin))
[void]$Report.AppendLine("")
foreach ($Item in $ZipInventory) { [void]$Report.AppendLine(("ZIP INVENTORY: {0} | cs={1} ps1={2}" -f $Item.zip,$Item.cs_entries,$Item.ps1_entries)) }
[void]$Report.AppendLine("")
foreach ($Item in $ZipSourceHits) { [void]$Report.AppendLine(("ZIP SOURCE HIT: score={0} exact={1} sha={2} :: {3} :: {4}" -f $Item.score,$Item.exact_historical_source,$Item.sha256,$Item.zip,$Item.entry)) }
[void]$Report.AppendLine("")
foreach ($Item in $StructuralLooseFiles) { [void]$Report.AppendLine(("STRUCTURAL LOOSE SOURCE: score={0} sha={1} :: {2}" -f $Item.score,$Item.sha256,$Item.path)) }
Write-Utf8NoBom $ReportPath $Report.ToString()
Pass-R6 (Test-Path -LiteralPath $ReportPath -PathType Leaf) "RD3 recovery report written"
Pass-R6 (Test-Path -LiteralPath $JsonPath -PathType Leaf) "RD3 recovery JSON written"

$StateColor = $(if ($Disposition -like "PASS*") { "Green" } else { "Yellow" })
Write-Host ""
Write-Host "======================================================================" -ForegroundColor $StateColor
Write-Host (" R6-G0 RD3 " + $Disposition) -ForegroundColor $StateColor
Write-Host "======================================================================" -ForegroundColor $StateColor
Write-Host ("REPORT  : " + $ReportPath)
Write-Host ("JSON    : " + $JsonPath)
if (Test-Path -LiteralPath $RecoveredSourcePath -PathType Leaf) { Write-Host ("SOURCE  : " + $RecoveredSourcePath); Write-Host ("SHA256  : " + (Get-Sha256Upper $RecoveredSourcePath)) }
if (Test-Path -LiteralPath $RecoveredBuilderPath -PathType Leaf) { Write-Host ("BUILDER : " + $RecoveredBuilderPath) }
if (Test-Path -LiteralPath $RecoveredPackagePath -PathType Leaf) { Write-Host ("PACKAGE : " + $RecoveredPackagePath) }
Write-Host ""
if ($Disposition -eq "STOP_NO_AUTHORITATIVE_BUILD_MATERIAL") { exit 2 }
exit 0
