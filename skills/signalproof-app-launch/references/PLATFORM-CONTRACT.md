# Platform-specific interpretation of the app launch standard

| Class | Launch contract | Test |
|---|---|---|
| HOSTED_WEB | Published URL, no developer server run by end user | HTTPS navigation, reload, authorization, persistence |
| PWA | Supported install/shortcut plus URL, true manifest and platform installation behavior | Install, reopen, update/offline claims if promised |
| LOCAL_WEB_DESKTOP | Normal double-click of GUI launcher, owned localhost server and browser UI | No console, correct UI, duplicate launch, wrong occupant, Quit |
| NATIVE_DESKTOP | Normal OS GUI executable or installed app icon | Double-click, error UI, close and reopen, uninstall if an installer exists |
| HYBRID | Native GUI launcher manages own web/native lifecycle | Both local-host and native lifecycle checks |
| NOT_APPLICABLE | Explicit CLI/headless/library classification | No false EXE requirement |

Windows precedent: `go build -ldflags='-H=windowsgui'`, static PE Subsystem=2; no persistent console. Do not assume Go is mandatory. A portable executable is not OS registration or an MSI. Human runtime evidence remains necessary.
