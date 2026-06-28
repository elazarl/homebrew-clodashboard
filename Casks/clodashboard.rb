cask "clodashboard" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "c537a2b52a641effe6403568aa3536d880d0674a0841a54643af2ecb0f5c5758",
         intel: "3719eea9d6f848c288cb124f23bb88490e9e660eb0d418a66d82a18424f6bf4f"

  url "https://github.com/elazarl/homebrew-clodashboard/releases/download/v#{version}/clodashboard-#{version}-#{arch}-apple-darwin.tar.gz"
  name "clodashboard"
  desc "Watch terminal panes and auto-detect/auto-approve prompts"
  homepage "https://github.com/elazarl/clodashboard"

  # Self-contained binary: the SetFit question-detection model is embedded, so
  # there is no Python/uv/venv dependency.
  binary "clodashboard"

  caveats <<~EOS
    clodashboard is an unsigned binary. If macOS Gatekeeper blocks it, either:
      xattr -dr com.apple.quarantine "#{staged_path}/clodashboard"
    or install with:
      brew install --cask --no-quarantine clodashboard
  EOS
end
