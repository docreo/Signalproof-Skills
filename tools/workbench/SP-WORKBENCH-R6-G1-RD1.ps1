$ErrorActionPreference="Stop"; Set-StrictMode -Version 2.0
$E="F:\Downloads\Quarantine\Evidence"
$Base=Join-Path $E "SP-WORKBENCH-R6-G0-EV-RD3\recovered\SignalproofWorkbenchGuiRd2-R5.1-RECOVERED.cs"
$BaseSha="B4FF2051B3B8FDD4DEED9C7AF5271B395C38255D9578753A1CF6F18002489B12"
$Prod="F:\Signalproof\Apps\Signalproof Governor\client\Signalproof-LLM-Workbench-V1-RD3.exe"
$ProdSha="C47416969095B83B9788ED939BB31CC90A75EBA40FD330A9EEB5DEB30FB6174F"
$LogoSha="4B660A3C4F9F75BEF0F6552747A61FD8178ACD0AA6C0B4F441FB9EB69CC88EDD"
$C=Join-Path $E "Signalproof-Workbench-GUI-RD2-R6-G1-RD1"
$Src=Join-Path $C "src\SignalproofWorkbenchGuiRd2-R6-G1.cs"
$Exe=Join-Path $C "build\Signalproof-Workbench-RD2-R6-G1-RD1.exe"
$ST=Join-Path $C "evidence\workbench-self-test.json"
$Report=Join-Path $C "BUILD-REPORT.txt"
function H($p){(Get-FileHash -LiteralPath $p -Algorithm SHA256).Hash.ToUpperInvariant()}
function P($x,$m){if(-not $x){throw "STOP: $m"};Write-Host "PASS: $m" -ForegroundColor Green}
function W($p,$t){[IO.File]::WriteAllText($p,$t,(New-Object Text.UTF8Encoding($false)))}
function CloseBrace($t,$o){$d=0;$s=$false;$q=$false;$esc=$false;$lc=$false;$bc=$false;for($i=$o;$i-lt$t.Length;$i++){$c=$t[$i];$n=if($i+1-lt$t.Length){$t[$i+1]}else{[char]0};if($lc){if($c-eq"`n"){$lc=$false};continue};if($bc){if($c-eq'*'-and$n-eq'/'){$bc=$false;$i++};continue};if($s){if($esc){$esc=$false;continue};if($c-eq'\'){$esc=$true;continue};if($c-eq'"'){$s=$false};continue};if($q){if($esc){$esc=$false;continue};if($c-eq'\'){$esc=$true;continue};if($c-eq"'"){$q=$false};continue};if($c-eq'/'-and$n-eq'/'){$lc=$true;$i++;continue};if($c-eq'/'-and$n-eq'*'){$bc=$true;$i++;continue};if($c-eq'"'){$s=$true;continue};if($c-eq"'"){$q=$true;continue};if($c-eq'{'){$d++}elseif($c-eq'}'){$d--;if($d-eq0){return $i}}};-1}
function M($t,$n){$r=[regex]::Match($t,"(?m)^\s*(?:public|private|protected|internal)\s+(?:static\s+)?(?:async\s+)?[\w<>\[\],\.\?]+\s+$([regex]::Escape($n))\s*\((?<p>[^)]*)\)\s*\{");if(!$r.Success){return $null};$o=$t.IndexOf("{",$r.Index);$z=CloseBrace $t $o;if($z-lt0){return $null};[pscustomobject]@{i=$r.Index;o=$o;z=$z;l=$z-$r.Index+1;p=$r.Groups["p"].Value;x=$t.Substring($r.Index,$z-$r.Index+1)}}
function Native($f,$a,$wd,$ms){$pi=New-Object Diagnostics.ProcessStartInfo;$pi.FileName=$f;$pi.WorkingDirectory=$wd;$pi.UseShellExecute=$false;$pi.CreateNoWindow=$true;$pi.RedirectStandardOutput=$true;$pi.RedirectStandardError=$true;$pi.Arguments=($a|%{if($_-match'[\s"]'){'"'+($_-replace'"','\"')+'"'}else{$_}})-join' ';$p=New-Object Diagnostics.Process;$p.StartInfo=$pi;[void]$p.Start();$so=$p.StandardOutput.ReadToEndAsync();$se=$p.StandardError.ReadToEndAsync();if(!$p.WaitForExit($ms)){try{$p.Kill()}catch{};throw "STOP: native timeout"};$p.WaitForExit();[pscustomobject]@{code=$p.ExitCode;out=$so.Result;err=$se.Result}}

$tok=$null;$er=$null;[Management.Automation.Language.Parser]::ParseFile($PSCommandPath,[ref]$tok,[ref]$er)|Out-Null;if(@($er).Count){$er|%{Write-Host ("LINE "+$_.Extent.StartLineNumber+": "+$_.Message)-ForegroundColor Red};throw "STOP: parser"}
$self=H $PSCommandPath
Write-Host "";Write-Host "======================================================================" -ForegroundColor Cyan;Write-Host " SIGNALPROOF WORKBENCH RD2 R6 G1 RD1" -ForegroundColor Cyan;Write-Host " UX + VERSION + CODE ARTIFACT WORKSPACE" -ForegroundColor Cyan;Write-Host "======================================================================" -ForegroundColor Cyan;Write-Host "RUNNER SHA256: $self"
$id=[Security.Principal.WindowsIdentity]::GetCurrent();$pr=New-Object Security.Principal.WindowsPrincipal($id);P (-not $pr.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) "normal non-elevated owner"
P (!(Test-Path -LiteralPath $C)) "fresh G1 candidate lane";P ((Test-Path $Base)-and(H $Base)-eq$BaseSha) "exact R5.1 recovered source";P ((Test-Path $Prod)-and(H $Prod)-eq$ProdSha) "protected production exact"
$csc=@("$env:WINDIR\Microsoft.NET\Framework64\v4.0.30319\csc.exe","$env:WINDIR\Microsoft.NET\Framework\v4.0.30319\csc.exe")|?{Test-Path $_}|Select-Object -First 1;P ($null-ne$csc) "existing .NET Framework compiler"
$logos=@("$E\Signalproof-Workbench-Logo.png","$E\B8A-GOV-D4-WORKBENCH-V1-RD3-AUTH-R2\Assets\Brand\product-logo.png","$E\Signalproof-Workbench-GUI-RD2-R5.1-H1-SELF-TEST-FIX\Assets\Brand\product-logo.png","$E\Signalproof-Workbench-GUI-RD2-R5.1-DETERMINISTIC-SCROLL\Assets\Brand\product-logo.png")
$logo=$logos|?{(Test-Path $_)-and(H $_)-eq$LogoSha}|Select-Object -First 1;P ($null-ne$logo) "approved Workbench logo"
New-Item -ItemType Directory -Path "$C\src","$C\Assets\Brand","$C\build\Assets\Brand","$C\evidence" -Force|Out-Null;Copy-Item $logo "$C\Assets\Brand\product-logo.png";Copy-Item $logo "$C\build\Assets\Brand\product-logo.png"

$s=[IO.File]::ReadAllText($Base,[Text.Encoding]::UTF8);P ($s.Contains("Signalproof.Governor.Request.v1")-and!$s.Contains("127.0.0.1:11434")-and!$s.Contains("Process.Start")) "protected transport/no-bypass baseline"
$a=M $s "AddMessage";P ($null-ne$a) "AddMessage localized";$sp=@([regex]::Matches($a.p,'(?i)(?:^|,)\s*string\s+([A-Za-z_]\w*)')|%{$_.Groups[1].Value});P ($sp.Count-ge1) "message payload localized";$msg=$sp[-1]
$rf=@([regex]::Matches($s,'(?m)^\s*(?:private|public|protected|internal)\s+(?:readonly\s+)?RichTextBox\s+([A-Za-z_]\w*)')|%{$_.Groups[1].Value}|Sort-Object -Unique);P ($rf.Count-ge1) "RichTextBox field localized";$tr=$null;$best=-1;foreach($f in $rf){$n=([regex]::Matches($a.x,'\b'+[regex]::Escape($f)+'\b')).Count;if($n-gt$best){$best=$n;$tr=$f}};P ($null-ne$tr) "transcript field selected";Write-Host "TRANSCRIPT FIELD: $tr"
$cm=[regex]::Match($s,'(?m)^\s*(?:internal|public|private|protected)?\s*(?:sealed\s+)?class\s+[A-Za-z_]\w*\s*:\s*Form\s*\{');P $cm.Success "Workbench Form class localized";$co=$s.IndexOf("{",$cm.Index)

$members=@"

        private const string SpCandidateIdentity = "RD2 R6-G1 Candidate";
        private string spLastCodeArtifact = "";
        private string spLastCodeLanguage = "";
        private bool spArtifactMenuReady = false;
        private bool spAllowAutoFollow = true;

        private bool SpNearBottom()
        {
            if ($tr == null || $tr.TextLength == 0) return true;
            int x = Math.Max(1, $tr.ClientSize.Width - 8);
            int y = Math.Max(1, $tr.ClientSize.Height - 8);
            int v = $tr.GetCharIndexFromPosition(new Point(x,y));
            return ($tr.TextLength - v) < 12;
        }
        private void SpMargins()
        {
            if ($tr == null) return;
            int g = Math.Max(24, (($tr.ClientSize.Width - 1080) / 2) + 24);
            $tr.SelectionStart=$tr.TextLength; $tr.SelectionLength=0;
            $tr.SelectionIndent=g; $tr.SelectionRightIndent=g;
        }
        private void SpJump()
        {
            spAllowAutoFollow=true; this.Text="Signalproof Workbench - RD2 R6-G1 Candidate";
            ScrollTranscriptToBottom();
        }
        private void SpCaptureArtifact(string text)
        {
            if(String.IsNullOrEmpty(text))return;
            int close=text.LastIndexOf("```",StringComparison.Ordinal); if(close<=2)return;
            int open=text.LastIndexOf("```",close-1,StringComparison.Ordinal); if(open<0)return;
            int eol=text.IndexOf('\n',open+3); if(eol<0||eol>=close)return;
            string lang=text.Substring(open+3,eol-open-3).Trim();
            string code=text.Substring(eol+1,close-eol-1).TrimEnd('\r','\n');
            if(String.IsNullOrWhiteSpace(code))return;
            spLastCodeLanguage=String.IsNullOrWhiteSpace(lang)?"text":lang; spLastCodeArtifact=code;
            SpMenu(); SpMargins();
            $tr.SelectionColor=Color.FromArgb(232,32,44); $tr.SelectionFont=new Font("Segoe UI",9f,FontStyle.Bold);
            $tr.AppendText(Environment.NewLine+"CODE ARTIFACT AVAILABLE");
            $tr.SelectionColor=TextMuted; $tr.SelectionFont=new Font("Segoe UI",8.75f,FontStyle.Regular);
            $tr.AppendText("  |  Right-click transcript: View / Edit, Copy, Save As"+Environment.NewLine);
            $tr.SelectionColor=TextMain;
        }
        private void SpMenu()
        {
            if(spArtifactMenuReady||$tr==null)return;
            ContextMenuStrip m=new ContextMenuStrip();
            ToolStripMenuItem o=new ToolStripMenuItem("View / Edit Code Artifact");
            ToolStripMenuItem c=new ToolStripMenuItem("Copy Code Artifact");
            ToolStripMenuItem s=new ToolStripMenuItem("Save Code Artifact As...");
            ToolStripMenuItem j=new ToolStripMenuItem("Jump to latest");
            o.Click+=delegate{SpEditor();}; c.Click+=delegate{SpCopy();}; s.Click+=delegate{SpSave(spLastCodeArtifact);}; j.Click+=delegate{SpJump();};
            m.Items.Add(o);m.Items.Add(c);m.Items.Add(s);m.Items.Add(new ToolStripSeparator());m.Items.Add(j);
            $tr.ContextMenuStrip=m; spArtifactMenuReady=true;
        }
        private string SpExt()
        {
            string l=(spLastCodeLanguage??"").Trim().ToLowerInvariant();
            if(l=="html"||l=="htm")return ".html"; if(l=="css")return ".css"; if(l=="javascript"||l=="js")return ".js";
            if(l=="powershell"||l=="ps1")return ".ps1"; if(l=="python"||l=="py")return ".py"; if(l=="csharp"||l=="cs")return ".cs";
            if(l=="json")return ".json"; if(l=="xml")return ".xml"; if(l=="sql")return ".sql"; if(l=="markdown"||l=="md")return ".md"; return ".txt";
        }
        private void SpCopy()
        {
            if(String.IsNullOrEmpty(spLastCodeArtifact)){MessageBox.Show(this,"No fenced code artifact is available.","Code Artifact");return;}
            Clipboard.SetText(spLastCodeArtifact);
        }
        private void SpSave(string text)
        {
            if(String.IsNullOrEmpty(text)){MessageBox.Show(this,"No code artifact is available to save.","Code Artifact");return;}
            using(SaveFileDialog d=new SaveFileDialog()){d.Title="Save Code Artifact As";d.FileName="signalproof-artifact"+SpExt();d.Filter="All files (*.*)|*.*";
                if(d.ShowDialog(this)==DialogResult.OK){File.WriteAllText(d.FileName,text,new UTF8Encoding(false));spLastCodeArtifact=text;}}
        }
        private void SpEditor()
        {
            if(String.IsNullOrEmpty(spLastCodeArtifact)){MessageBox.Show(this,"No fenced code artifact is available.","Code Artifact");return;}
            using(Form f=new Form())
            {
                f.Text="Signalproof Workbench - Code Artifact - "+spLastCodeLanguage;f.StartPosition=FormStartPosition.CenterParent;f.MinimumSize=new Size(760,520);f.Size=new Size(1050,760);f.BackColor=Bg;f.ForeColor=TextMain;
                Panel bar=new Panel{Dock=DockStyle.Top,Height=48,BackColor=Panel,Padding=new Padding(12,8,12,6)};
                Label id=MakeLabel("CODE ARTIFACT  |  "+spLastCodeLanguage+"  |  "+SpCandidateIdentity,9f,FontStyle.Bold,TextMuted);id.Dock=DockStyle.Left;id.Padding=new Padding(0,7,0,0);bar.Controls.Add(id);
                FlowLayoutPanel act=new FlowLayoutPanel{Dock=DockStyle.Right,Width=330,FlowDirection=FlowDirection.LeftToRight,WrapContents=false,BackColor=Color.Transparent};
                Button cp=MakeButton("Copy",false);cp.Width=86;Button sv=MakeButton("Save As",true);sv.Width=96;Button bk=MakeButton("Back to Chat",false);bk.Width=118;act.Controls.Add(cp);act.Controls.Add(sv);act.Controls.Add(bk);bar.Controls.Add(act);
                RichTextBox ed=new RichTextBox{Dock=DockStyle.Fill,Multiline=true,AcceptsTab=true,WordWrap=false,DetectUrls=false,BackColor=Color.FromArgb(13,13,16),ForeColor=TextMain,BorderStyle=BorderStyle.None,Font=new Font("Consolas",10.5f),Text=spLastCodeArtifact};
                cp.Click+=delegate{if(!String.IsNullOrEmpty(ed.Text))Clipboard.SetText(ed.Text);};sv.Click+=delegate{SpSave(ed.Text);};bk.Click+=delegate{spLastCodeArtifact=ed.Text;f.Close();};f.FormClosing+=delegate{spLastCodeArtifact=ed.Text;};
                f.Controls.Add(ed);f.Controls.Add(bar);f.ShowDialog(this);
            }
        }
"@
$s=$s.Insert($co+1,$members)
$a=M $s "AddMessage";$sp=@([regex]::Matches($a.p,'(?i)(?:^|,)\s*string\s+([A-Za-z_]\w*)')|%{$_.Groups[1].Value});$msg=$sp[-1]
$ax=$a.x;$ao=$ax.IndexOf("{");$ax=$ax.Insert($ao+1,("`r`n            spAllowAutoFollow=SpNearBottom(); SpMenu(); SpMargins(); if(!spAllowAutoFollow)this.Text=`"Signalproof Workbench - RD2 R6-G1 Candidate - New response below`";"));$az=$ax.LastIndexOf("}");$ax=$ax.Insert($az,("`r`n            if(!String.IsNullOrEmpty($msg)&&$msg.IndexOf(`"```",StringComparison.Ordinal)>=0)SpCaptureArtifact($msg);`r`n"));$s=$s.Substring(0,$a.i)+$ax+$s.Substring($a.i+$a.l)
$sc=M $s "ScrollTranscriptToBottom";P ($null-ne$sc) "scroll method localized";$x=$sc.x;$o=$x.IndexOf("{");$x=$x.Insert($o+1,"`r`n            if(!spAllowAutoFollow)return;");$s=$s.Substring(0,$sc.i)+$x+$s.Substring($sc.i+$sc.l)
$sd=M $s "SendCurrentPrompt";P ($null-ne$sd) "send method localized";$x=$sd.x;$o=$x.IndexOf("{");$x=$x.Insert($o+1,'`r`n            spAllowAutoFollow=true; this.Text="Signalproof Workbench - RD2 R6-G1 Candidate";');$s=$s.Substring(0,$sd.i)+$x+$s.Substring($sd.i+$sd.l)
P ($s.Contains('"Governed AI Workspace"')) "viewer subtitle localized";$s=$s.Replace('"Governed AI Workspace"','"Governed AI Workspace  |  RD2 R6-G1 Candidate"')
$bs=M $s "BuildShell";if($null-ne$bs){$x=$bs.x;$o=$x.IndexOf("{");$x=$x.Insert($o+1,'`r`n            this.Text="Signalproof Workbench - RD2 R6-G1 Candidate";');$s=$s.Substring(0,$bs.i)+$x+$s.Substring($bs.i+$bs.l)}
W $Src $s;$ss=H $Src;Write-Host "G1 SOURCE SHA256: $ss"
$f=[IO.File]::ReadAllText($Src);P ($f.Contains("SpEditor")-and$f.Contains("CODE ARTIFACT AVAILABLE")-and$f.Contains("RD2 R6-G1 Candidate")) "G1 artifact/version surfaces present";P ($f.Contains("Signalproof.Governor.Request.v1")-and!$f.Contains("127.0.0.1:11434")-and!$f.Contains("Process.Start")-and!$f.Contains("cmd.exe")-and!$f.Contains("powershell.exe")) "G1 no-bypass contract";P ($f.Contains("CreateNewSession")-and$f.Contains("DeleteCurrentSession")-and$f.Contains("RenameSelectedBot")-and$f.Contains("DeleteSelectedBot")) "Session/Bot surfaces preserved";P ($f.Contains("composer_overlap_prevented")-and$f.Contains("transcript_native_bottom_scroll")) "R5.1 layout/scroll markers preserved"
$ca=@("/nologo","/target:winexe","/optimize+","/platform:anycpu","/out:$Exe","/reference:System.dll","/reference:System.Core.dll","/reference:System.Drawing.dll","/reference:System.Windows.Forms.dll",$Src)
$r=Native $csc $ca $C 60000;if($r.out){Write-Host $r.out};if($r.err){Write-Host $r.err};P ($r.code-eq0) "C# compile exit 0";P (Test-Path $Exe) "G1 executable created";$es=H $Exe;Write-Host "G1 EXE SHA256: $es"
$r=Native $Exe @("--self-test=$ST") "$C\build" 30000;if($r.out){Write-Host $r.out};if($r.err){Write-Host $r.err};P ($r.code-eq0) "self-test exit 0";P (Test-Path $ST) "self-test evidence exists";$st=[IO.File]::ReadAllText($ST);P ($st.Contains('"composer_overlap_prevented": true')-and$st.Contains('"transcript_native_bottom_scroll": true')-and$st.Contains('"transcript_follow_timer": false')) "R5.1 self-test contract preserved"
P ((H $Prod)-eq$ProdSha) "postflight production unchanged"
[IO.File]::WriteAllLines($Report,@("Signalproof Workbench RD2 R6 G1 RD1","Runner SHA256: $self","Base source SHA256: $BaseSha","G1 source SHA256: $ss","G1 EXE SHA256: $es","Production unchanged: $ProdSha","","Implemented: gutters, legible candidate identity, non-yanking follow-latest, fenced-code recognition, Code Artifact View/Edit, Copy, Save As, Back to Chat, no auto-execution.","Status: AUTOMATED PASS IF LAUNCH LIVENESS PASSES"),[Text.Encoding]::UTF8)
$p=New-Object Diagnostics.Process;$p.StartInfo=New-Object Diagnostics.ProcessStartInfo;$p.StartInfo.FileName=$Exe;$p.StartInfo.WorkingDirectory="$C\build";$p.StartInfo.UseShellExecute=$false;[void]$p.Start();Start-Sleep -Milliseconds 1800;P (-not$p.HasExited) "candidate launch-liveness";Write-Host "CANDIDATE PID: $($p.Id)"
Write-Host "";Write-Host "======================================================================" -ForegroundColor Green;Write-Host " AUTOMATED PASS / USER UI TEST READY" -ForegroundColor Green;Write-Host "======================================================================" -ForegroundColor Green;Write-Host "Candidate : $Exe";Write-Host "EXE SHA256: $es";Write-Host "Source SHA: $ss";Write-Host "Report    : $Report";Write-Host "";Write-Host "TEST: version/build legible; generate fenced HTML; CODE ARTIFACT AVAILABLE; right-click View/Edit; Copy; Save As; Back to Chat; Sessions/Bots and Granite conversation still work." -ForegroundColor Yellow
