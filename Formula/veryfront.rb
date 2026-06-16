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
  version "0.1.823"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.823/veryfront-macos-arm64"
      sha256 "a3db97b2a8fc8389cb4044a88a231eb1532ce16100cc96098b1bcdb0098d2400"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.823/veryfront-macos-x64"
      sha256 "fe317087b458345226ffdd165a18ae4e364f0f23ee8a46155386edb5bfd3434e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.823/veryfront-linux-arm64"
      sha256 "8d0da53b851d5bf5a6fec90c63ce605a94b3b02881f976035ea1eb504464f007"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.823/veryfront-linux-x64"
      sha256 "0eb303437b4afd6ce07e2f059c7425aac551defe32fd84acc7a139627545e713"
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
