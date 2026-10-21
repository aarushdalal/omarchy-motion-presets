# Release privacy

Current release files use portable paths. The showcase gallery contains reviewed,
silent recordings with source metadata removed; identity-bearing regions are cropped
or masked. Only media matching `tools/approved-preview-media.json` is approved for
release. Unreviewed recordings, logs, Git metadata copies and runtime configuration
are not release assets. The sample SVG remains a design illustration.

See [showcase details](SHOWCASE.md) for recording formats and review scope.

Existing Git history is preserved. Historical commits and media may retain older
metadata; this cleanup does not remove previously published copies. New commits use
a GitHub noreply address. Public repository URLs, stable plugin IDs and license
attribution remain as intentional project provenance.

Run `python3 tools/release_privacy_check.py` before publication. It scans the current
payload and rejects operational identity, credentials and unreviewed showcase media.
It is a release gate, not proof that arbitrary third-party files contain no secrets.
