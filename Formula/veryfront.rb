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
  version "0.1.1122"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1122/veryfront-macos-arm64"
      sha256 "32b83667ead066b71a9a2003d90463a929776b0a8bfed719a1ef1e2935b5e2ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1122/veryfront-macos-x64"
      sha256 "a4e02327f2149063f8b653cd99ee764f15650c4e8b091e4d92aca689442aa298"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1122/veryfront-linux-arm64"
      sha256 "c8f022f4b916a0d0d768eaa756ca28bc997e97134da0fd62382400ca01a1f341"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1122/veryfront-linux-x64"
      sha256 "9e63a0f9efae852bb00da13e80c52a0bce812c8ca61bb7636e941fa55c7f1556"
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
