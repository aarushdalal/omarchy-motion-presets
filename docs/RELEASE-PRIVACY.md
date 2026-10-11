# Release privacy

Current release files use portable paths and sample data. Workstation screenshots,
recordings, logs, Git metadata copies and runtime configuration are not release assets.
The sample SVG is a design illustration, not a claim of a captured live desktop.

Existing Git history is preserved. Historical commits and media may retain older
metadata; this cleanup does not remove previously published copies. New commits use
a GitHub noreply address. Public repository URLs, stable plugin IDs and license
attribution remain as intentional project provenance.

Run `python3 tools/release_privacy_check.py` before publication. It scans the current
payload and rejects operational identity, credentials and unreviewed showcase media.
It is a release gate, not proof that arbitrary third-party files contain no secrets.
