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
  version "0.1.672"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.672/veryfront-macos-arm64"
      sha256 "f48cf0cec92942d2121923ce6ecf464950e795e3b9209a4dcb8a1f0a513244ba"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.672/veryfront-macos-x64"
      sha256 "a4d99b973519d983e3bbe574ba00adc46cd1f31e0f2e8071a712da5785b4f1b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.672/veryfront-linux-arm64"
      sha256 "0e54f0a53570dc5a5ba7b70cf64c383a5039f4c1c89899b4c1b21756d206f2a1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.672/veryfront-linux-x64"
      sha256 "a606698e8a4abf0d3b782debd16164e2d30874d13f9b34a08559039189c5693c"
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
