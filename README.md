# homebrew-clodashboard

Homebrew tap for [clodashboard](https://github.com/elazarl/clodashboard) — a tool
that watches terminal panes and auto-detects/auto-approves prompts. The
question-detection model is embedded in the binary (no Python/uv/venv needed).

## Install

```sh
brew tap elazarl/clodashboard
brew trust elazarl/clodashboard      # required once: this is a third-party tap
brew install --cask clodashboard
```

Supports macOS arm64 (Apple Silicon) and x86_64 (Intel).

## Gatekeeper / signing

The binary is **unsigned and un-notarized**, so macOS quarantines downloaded
copies. The cask strips the quarantine flag on install, so it should just run.
If Gatekeeper still blocks it, allow it once via
**System Settings → Privacy & Security → "Open Anyway"**, or run:

```sh
xattr -dr com.apple.quarantine "$(brew --prefix)/bin/clodashboard"
```

The permanent fix is a Developer ID signature + Apple notarization (requires a
paid Apple Developer account); not yet applied.
