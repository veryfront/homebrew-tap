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
  version "0.1.973"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.973/veryfront-macos-arm64"
      sha256 "414ef942cffb33632a3ea63d4b3c8c3735ac02f65cc81c611a1cb4278b9d84c7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.973/veryfront-macos-x64"
      sha256 "2f76496c8c5a86d56639763d868ec4c51d013deb459f0718c249b261dd972d38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.973/veryfront-linux-arm64"
      sha256 "ba687629edb909906e82527be7fb1d5cb8dee344fe7f13cacf3233f17e3e536d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.973/veryfront-linux-x64"
      sha256 "4f3b9e82191987f7df6ee397363c815418fd402982fe6e76fd7a8f5aef2d82bb"
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
