cask "clodashboard" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.1"
  sha256 arm:   "c9423ac773394d272bf3d4961116607dbffb45411298f2799b2f6332f300e01c",
         intel: "7c3834647229b0ab4d1b39836c5d8f96930aa26d19340d0ae81e6248ce6db48a"

  url "https://github.com/elazarl/homebrew-clodashboard/releases/download/v#{version}/clodashboard-#{version}-#{arch}-apple-darwin.tar.gz"
  name "clodashboard"
  desc "Watch terminal panes and auto-detect/auto-approve prompts"
  homepage "https://github.com/elazarl/clodashboard"

  depends_on :macos

  # Native SwiftUI dashboard (a client of the local `clodashboard serve` API).
  app "Clodashboard.app"
  # Self-contained CLI: the SetFit question-detection model is embedded, so there
  # is no Python/uv/venv dependency.
  binary "clodashboard"

  # Both are unsigned/un-notarized, so a downloaded copy is quarantined and
  # Gatekeeper blocks it ("Apple could not verify..."). Strip the quarantine flag
  # on install so they run. Replace this with proper Developer ID notarization
  # once a signing identity is available.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/clodashboard"]
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/Clodashboard.app"]
  end

  caveats <<~EOS
    clodashboard ships an unsigned CLI and a native app; this cask removes the
    macOS quarantine flag on install. If Gatekeeper still blocks them, allow once
    via System Settings -> Privacy & Security -> "Open Anyway".

    Just open Clodashboard.app — it starts `clodashboard serve` itself
    (over a Unix socket; no TCP port is taken). To also reach the dashboard
    from a phone/browser, run `clodashboard serve -p 8080` yourself.
  EOS
end
