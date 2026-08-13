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
  version "0.1.1234"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1234/veryfront-macos-arm64"
      sha256 "e77e2bdaf1c732283ae732b6188fd6a86c5267100003ce82a6b338e5b4d35d79"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1234/veryfront-macos-x64"
      sha256 "4e1a479ae1d573316942b7c5bc81891adb1374d28eff63919e8cf48217839edb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1234/veryfront-linux-arm64"
      sha256 "eb9bf5f49025b9592ae4f59838d6798c52e08a031dda0930b626948ddeffa814"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1234/veryfront-linux-x64"
      sha256 "3d689ebb1ce3600eb3a43966d1bed5d67f00f61fef50fb07123bf313218d42ad"
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
