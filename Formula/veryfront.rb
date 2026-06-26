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
  version "0.1.934"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.934/veryfront-macos-arm64"
      sha256 "857cd1d64ccba821993e551f93b9e89ebb7e174c0b6b1a211fd3c6d879c98a91"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.934/veryfront-macos-x64"
      sha256 "9332d6abd4e5e982d78b095a2d6a113f0f5ea50e80ba3edf35c543d170af2c8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.934/veryfront-linux-arm64"
      sha256 "d8112893d82fe2c1c6bedbe2756d3171284e558ca3c5c04797cfb3bad48d00ce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.934/veryfront-linux-x64"
      sha256 "95867d6434d8d1aa76e102a9a9af6d3e2db6d450b310769287d490e2a586c056"
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
