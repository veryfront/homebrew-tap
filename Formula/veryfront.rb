# Homebrew formula for Veryfront CLI
#
# To use this formula:
#   1. Create a tap: veryfront/homebrew-tap
#   2. Copy this file to: homebrew-tap/Formula/veryfront.rb
#   3. Users can then: brew install veryfront/tap/veryfront
#
# Or submit to homebrew-core for: brew install veryfront

class Veryfront < Formula
  desc "Zero-config React meta-framework for AI-native applications"
  homepage "https://veryfront.com"
  license "MIT"
  version "0.1.1222"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1222/veryfront-macos-arm64"
      sha256 "bdc2da5659e934da31c1b29fb1a4850b1d2cc87dba2e86e53cab3ed55f8df6ae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1222/veryfront-macos-x64"
      sha256 "fb6e4d43af096ba3ebe4b82196d33264cdbb8a45a9bd22f32665fd15c20921fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1222/veryfront-linux-arm64"
      sha256 "9ff65ecbd725fa26f4b79071d8589af64ada06c7fd57745652a1fe3dee2fe88f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1222/veryfront-linux-x64"
      sha256 "9e188b01c1596c00c6f9722d64ae9fb415b70dfe01dfa340d0fc7685d886b268"
    end
  end

  def install
    binary_name = "veryfront"
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "veryfront-macos-arm64" : "veryfront-macos-x64"
    elsif OS.linux?
      binary_name = Hardware::CPU.arm? ? "veryfront-linux-arm64" : "veryfront-linux-x64"
    end

    # The downloaded file is already the binary
    bin.install Dir["veryfront*"].first => "veryfront"
  end

  test do
    assert_match "veryfront", shell_output("#{bin}/veryfront --version")
  end
end
