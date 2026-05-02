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
  version "0.1.360"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.360/veryfront-macos-arm64"
      sha256 "bab997c304aa9c6c81c092427f031996bebae541a839e6eb729f7dec757c8556"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.360/veryfront-macos-x64"
      sha256 "fa2c100842d736f5b8a15461f41eb7f9cdf7adb52e3d115af0c2089f2bc654bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.360/veryfront-linux-arm64"
      sha256 "adef814bec286e866f3bb3ec76bbc86479d3f601f90625be23503689e1322eff"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.360/veryfront-linux-x64"
      sha256 "3aded8a853063032b0d155496a42dfc91411c11d966d0fec7ea802e1b392f8af"
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
