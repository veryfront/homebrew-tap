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
  version "0.1.126"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.126/veryfront-macos-arm64"
      sha256 "1d0faca9b4bab309bfb4c588d49e8d24949f20e92c85c9573876d1df33b0ccb5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.126/veryfront-macos-x64"
      sha256 "b9162d7fc9d310bcf0140c31c4b9eabb9275778c5fb2aadd0282b86d2de43ed6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.126/veryfront-linux-arm64"
      sha256 "0fdd71d8b6231993e84c3691f3f3b67765919fa8f4d4ff6ae3a222a6e91dbc2b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.126/veryfront-linux-x64"
      sha256 "a0df97827847ab73d42b3cc004b4ab648900b36ee78c4762d80466aaf0be041f"
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
