# KE-PY-MINIMAL-DISTRO-BOOTSTRAP-001

**Status:** CANDIDATE PUBLIC-SAFE KNOWN ERROR  
**Domain:** Python / minimal Linux distributions / build tooling

## Error

A Linux host exposes a working `python3` executable, but build automation assumes that `venv`, `ensurepip`, or `python3 -m pip` must therefore also be available. On minimal or distributor-managed Python installations, one or more of those packaging components may be intentionally absent or separately packaged. Consequential build work then fails before the actual target tool or model is tested.

## Fingerprints

Typical observations include:

- `python3 -m venv` fails because `ensurepip` is unavailable;
- the distribution suggests installing a separate `python3-venv` package;
- `python3 -m pip` reports that the `pip` module is unavailable;
- the system Python may be distributor-managed or externally managed;
- an attempted fix would require OS package mutation or `--break-system-packages` even though the build only needs isolated temporary dependencies.

## Prevention

Before a Python-dependent build or conversion gate:

1. prove the exact Python packaging capabilities actually required: interpreter, `venv`, `ensurepip`, `pip`, and any compiler/build prerequisites;
2. do not infer packaging capability merely from `python3 --version` or interpreter presence;
3. keep distributor/system Python state separate from temporary build dependencies;
4. prefer an isolated, explicit, user-space build dependency path when the task does not require OS mutation;
5. pin and record the bootstrap mechanism and dependency versions used;
6. when a standalone package bootstrap is used, validate its identity/version and record its cryptographic hash;
7. preserve the failure as tooling evidence and do not misclassify it as application, model, or runtime failure.

## Do not repeat

- Re-run `python3 -m venv` on the same host after `ensurepip` absence is established unless the environment has materially changed.
- Assume `python3 -m pip` exists simply because Python exists.
- Modify distro-managed/global Python just to satisfy a disposable build conversion path when a bounded isolated build path is available.
- Use `--break-system-packages` as a default workaround.
- Treat a missing packaging helper as evidence that the target application, converter, or model is defective.

## Related Signalproof known errors

- `KE-HIDDEN-DEPENDENCY-FALLBACK-001`
- `KE-REPEATED-FAILED-PATH-001`
- `KE-STATIC-RUNTIME-CONFLATION-001`
- `KE-SOURCE-AUTHORITY-CONFLATION-001`

## External basis

Python documents `ensurepip` as an optional module and advises users to consult their distributor when it is unavailable. PyPA's externally-managed-environments specification describes distributor-managed Python installations where global package mutation should be avoided. pip documents a standalone zip application that can execute under supported Python versions; that zipapp is experimental and should be treated as a bounded build/bootstrap mechanism rather than a production runtime dependency.

## Signalproof classification rule

When the target build has not yet executed, classify this as **TOOLING / ENVIRONMENT BLOCKED**, not as model/runtime/application failure.
