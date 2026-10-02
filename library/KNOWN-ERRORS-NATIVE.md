# Signalproof Native / Structured-Decoding Known Errors

**Status:** ACTIVE DETAIL AFTER GOVERNED MERGE  
**Parent catalog:** `skills/signalproof-known-errors/SKILL.md`

## KE-NATIVE-LINKER-LIBRARY-RESOLUTION-001

**Domain:** native build / shared-library resolution

**Error:** A valid local shared library and its dependency closure are present, but linker name lookup through `-L` and `-l<name>` still fails or resolves unpredictably in an isolated build path.

**Prevention:** First prove the intended library files, architecture, symlink targets, and runtime closure. When local name resolution remains the only failing variable, use explicit absolute shared-object paths with an appropriate local runtime search path before considering system-wide linker or library mutation.

**Do not repeat:** Rebuild or globally install an already-proven local library solely because `-l<name>` lookup failed without first testing exact-path linking.

## KE-GBNF-JSON-LITERAL-ESCAPING-001

**Domain:** structured decoding / grammar embedding

**Error:** A grammar embedded in a host-language string is over-escaped or under-escaped, so constrained generation emits literal escape characters or otherwise invalid JSON even though the grammar sampler is active.

**Prevention:** Treat host-language escaping and grammar-language escaping as separate layers. Inspect the exact generated grammar text that reaches the grammar parser, compare it with the grammar engine's canonical literal syntax, and require a contract-valid structured-output smoke before interpreting model behavior.

**Do not repeat:** Attribute contract-invalid constrained output to model quality before proving the exact grammar bytes/text generate syntactically valid target objects.
