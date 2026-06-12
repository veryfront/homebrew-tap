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
  version "0.1.769"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.769/veryfront-macos-arm64"
      sha256 "cc83ccc3b6d0371905dc01e12db86d511f27be3f4005c8bf9322bcb106bf14ff"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.769/veryfront-macos-x64"
      sha256 "b41f2b0b8071c153e5b635c0a2c5fd37766447fda6ac82b259f736d8212f15fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.769/veryfront-linux-arm64"
      sha256 "ea83df8c38003edb199d69e656c248ad58a26f3a13762405013026d85e2a8c70"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.769/veryfront-linux-x64"
      sha256 "24238b5b7f645ea4612f7024e45b5a71e9696dfde7382668418a3630ff7545ae"
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
