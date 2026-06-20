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
  version "0.1.883"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.883/veryfront-macos-arm64"
      sha256 "63a5b347afed443113373d08d3cf8447960ea477849b2725219601090d016975"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.883/veryfront-macos-x64"
      sha256 "33ead1b34f3b270dfbf9b890400f33116114797bb71409ac01ebc47440565644"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.883/veryfront-linux-arm64"
      sha256 "985adfd0e140f91545e5a935554ed11c3523af9dd24891f99f357a174b2641bf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.883/veryfront-linux-x64"
      sha256 "efb915249d0d852160546a9db69a55152498f6d6d8ac4840e01a3a45162aabb2"
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
