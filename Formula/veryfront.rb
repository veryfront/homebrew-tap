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
  version "0.1.419"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.419/veryfront-macos-arm64"
      sha256 "256895ccf391483a645fe3742ef1d2bbe014133274992b58e3415a831caf72ac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.419/veryfront-macos-x64"
      sha256 "3b5ca34dd99aad43d7341c77f9b18b54b575a7f009a70ee202dc0d127573f3a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.419/veryfront-linux-arm64"
      sha256 "6a2df78cd9f63b71a2070a81a2fbaaab7b458fa26d0996521f81c735d84bc771"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.419/veryfront-linux-x64"
      sha256 "5f93195b1ca4c6e6a9904589c9e5a03be44d5d4549b8c55717c0aa9af1ef6119"
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
