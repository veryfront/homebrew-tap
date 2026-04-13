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
  version "0.1.195"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.195/veryfront-macos-arm64"
      sha256 "91148ee630392af3f2df7feffdf2d87732d2b7195a55fa87bf8c745b2cf3bd1d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.195/veryfront-macos-x64"
      sha256 "eb40999583472e914f9fb7ce1ba6258eedf65ccbea3841ee6eea2dc813fb6b5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.195/veryfront-linux-arm64"
      sha256 "88992560e425d3ff6999dd3356897fce1ef9a5c72aeaa38579f654154e01f402"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.195/veryfront-linux-x64"
      sha256 "6e9a2da1c53537dac065c532014fbdee998ff10a03e12c0b5c62c72934cc3ce9"
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
