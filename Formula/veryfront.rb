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
  version "0.1.1064"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1064/veryfront-macos-arm64"
      sha256 "b0792105c2c658c361b8bd90186434397aeb1d527bf98f26d7c8c5b837fda9f0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1064/veryfront-macos-x64"
      sha256 "d085d1c30d9af6422d64858518548b031add0d66406c71c3540c86ca73b8d958"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1064/veryfront-linux-arm64"
      sha256 "cbaf2d8f34b01adec268c85a6f73e5c835b95beeef5a2867938ccb96c160e965"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1064/veryfront-linux-x64"
      sha256 "07c9e9a1b3365d11c811e1b6aba3bed1976ea4e473105b82bcf8cf8598fccca9"
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
