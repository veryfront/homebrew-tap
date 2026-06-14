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
  version "0.1.801"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.801/veryfront-macos-arm64"
      sha256 "a9f99ee480e36546b9f0c5b64a9e0bf8730950eb91419ba5c07c2127ccf7ef7f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.801/veryfront-macos-x64"
      sha256 "ff27ac8ca36c3f1d75d3f07310f86a408f586e50cf08937df41c32c8bf6672f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.801/veryfront-linux-arm64"
      sha256 "a948de490c15ae83ba3dbb4f717ae12645404c02b7450b11c7adc4a72a4593e7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.801/veryfront-linux-x64"
      sha256 "72f4def4b8726968d09b21c2674f0b02d41120f81a69b85c20dcb8055af0ec5c"
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
