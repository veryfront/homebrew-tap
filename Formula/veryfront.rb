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
  version "0.1.961"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.961/veryfront-macos-arm64"
      sha256 "559acd1dceb0b9785948e02624b3f2789684c064d3499dc9a95d73d2ec7c01b5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.961/veryfront-macos-x64"
      sha256 "d78c9f571011d00673bfa1e37be0370dd084f5900c84e0fec0a7aab516174bdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.961/veryfront-linux-arm64"
      sha256 "6faa71b3f9c604b651c0dc0e45e5adfe3fbf0f1d3e8d94f8f4559be99cf409a9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.961/veryfront-linux-x64"
      sha256 "870035ce2477a670d713adc8e5c48ae7831ed7da2ae8d47c9297e277b889fde2"
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
