cask "clodashboard" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "4c1b936bd93dace1c6b75a946b3ae5a9ec91e21d725de2fc41391954fb2945fc",
         intel: "37ae1e6b6bf2f46e93d174504fd4e83c10b2b9946de5aba1c7f3efef0d5ac224"

  url "https://github.com/elazarl/homebrew-clodashboard/releases/download/v#{version}/clodashboard-#{version}-#{arch}-apple-darwin.tar.gz"
  name "clodashboard"
  desc "Watch terminal panes and auto-detect/auto-approve prompts"
  homepage "https://github.com/elazarl/clodashboard"

  # Self-contained binary: the SetFit question-detection model is embedded, so
  # there is no Python/uv/venv dependency.
  binary "clodashboard"

  # The binary is unsigned/un-notarized, so a downloaded copy is quarantined and
  # Gatekeeper blocks it ("Apple could not verify..."). Strip the quarantine flag
  # on install so it runs. Replace this with proper Developer ID notarization once
  # a signing identity is available.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/clodashboard"]
  end

  caveats <<~EOS
    clodashboard is an unsigned binary; this cask removes the macOS quarantine
    flag on install. If Gatekeeper still blocks it, allow it once via
    System Settings -> Privacy & Security -> "Open Anyway".
  EOS
end
