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
  version "0.0.83"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.83/veryfront-macos-arm64"
      sha256 "f57766f7294330cf35b219fddbf3c852f57288e18b6f716202b42d999370e9f1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.83/veryfront-macos-x64"
      sha256 "0e1cee45e53284bdf49aac29443302354a043ceb2d3b4f16d987598bc1db9c9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.83/veryfront-linux-arm64"
      sha256 "522fc9f1a222a278dce392cf84c3f82a901e4147f6331113e5df508facf7b346"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.83/veryfront-linux-x64"
      sha256 "231cf9910a5966c421b9785e30d12717bf2694c31c89d9eeb16318735941899a"
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
