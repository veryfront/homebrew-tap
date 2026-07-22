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
  version "0.1.1105"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1105/veryfront-macos-arm64"
      sha256 "b1d1b903064106f1abe0d3209972ce6f8f81901bab454b1fe88808bf855798d1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1105/veryfront-macos-x64"
      sha256 "8fd65d1a8c8b042733fbbb081919ea6a9c1462aa73622a7fba0d810ebfc4025e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1105/veryfront-linux-arm64"
      sha256 "1b862863779075ae5babff6e30ed5f94636c621722647fddbc1f22bf7288c749"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1105/veryfront-linux-x64"
      sha256 "4842285f82bf4a14664337fa210b16d8988cc1cce16a83bc6e6b8f419fa0a4ae"
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
