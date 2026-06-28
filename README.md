# homebrew-clodashboard

Homebrew tap for [clodashboard](https://github.com/elazarl/clodashboard) — a tool
that watches terminal panes and auto-detects/auto-approves prompts. The
question-detection model is embedded in the binary (no Python/uv/venv needed).

## Install

```sh
brew tap elazarl/clodashboard
brew install --cask clodashboard
```

The binary is unsigned. If Gatekeeper blocks it, install with
`brew install --cask --no-quarantine clodashboard`, or run
`xattr -dr com.apple.quarantine "$(brew --prefix)/bin/clodashboard"`.

Supports macOS arm64 (Apple Silicon) and x86_64 (Intel).
