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
  version "0.1.1013"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1013/veryfront-macos-arm64"
      sha256 "23393a18b89a5dce6996f458683b96a7c7682736635ccccd8cd251760457587b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1013/veryfront-macos-x64"
      sha256 "83c024b43fb2a90b951ec2e03f508a1078ec5ef3f31fc50817a9dbbe13e0b3f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1013/veryfront-linux-arm64"
      sha256 "1f53b7924f4ebb21a728cea3b67ae0365d8cb296462ab340eef13c10ebbc52fc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1013/veryfront-linux-x64"
      sha256 "a12f490ead582f89c1b713ca36dfd00e7c19e2b9c8a9df5ca9c47085c124562d"
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
