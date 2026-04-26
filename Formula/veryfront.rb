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
  version "0.1.274"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.274/veryfront-macos-arm64"
      sha256 "9b4f52c732c01e6ce35f6afe1461628d7c9b6c89943ca0eace97f2b241e2e4ee"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.274/veryfront-macos-x64"
      sha256 "ca63dc428efe78f7bbc4d7773d34ac1a49868731bed9829924ed74d469c4fea3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.274/veryfront-linux-arm64"
      sha256 "9bcdfbfded33077b4e5acacdc35d452a853eeeb02b05a0c3a5dcf9d4b4c502b6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.274/veryfront-linux-x64"
      sha256 "6eca2f6a406f242bc15648c1902637adf98a3d8127774bfbcb00b7e47b2d4c13"
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
