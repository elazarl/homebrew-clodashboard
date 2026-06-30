cask "clodashboard" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "8043416bed69614ae794865aacdf93b80239198036aba2585868559588a3314c",
         intel: "90fff9e8f8bcb891bc110c34911cdd943cf4a354eec80549b0c695c04bf37cab"

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
