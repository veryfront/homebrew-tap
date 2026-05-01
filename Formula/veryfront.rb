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
  version "0.1.354"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.354/veryfront-macos-arm64"
      sha256 "ae5d4a12716e9f3d3edc57c16d0e9a30b050debba250275ae55a730962209752"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.354/veryfront-macos-x64"
      sha256 "7ddfc9caa14cf99b9ed3fe0bf4a1c35e6400304ce33f14b7b904b8e12778edc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.354/veryfront-linux-arm64"
      sha256 "c633dc405a9403d3d2d16f332c46c7e7b81ee720dca2c4bd6f8e7f5a5cf2e659"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.354/veryfront-linux-x64"
      sha256 "5567d53a7028764d584cd402485c635791e2aa02df67f7b2bc47b6d08e843b59"
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
