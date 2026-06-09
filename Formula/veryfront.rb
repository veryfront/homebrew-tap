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
  version "0.1.720"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.720/veryfront-macos-arm64"
      sha256 "7902737fecd36c96005fad0ff44d9259c9b1cfa9d8269698819b5e625e0c9a70"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.720/veryfront-macos-x64"
      sha256 "c38e1512998bcfd9ddc1da31c08f6f547d9e8284e61b9509f848f6481a37336e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.720/veryfront-linux-arm64"
      sha256 "1bc9cc5f56798c23666f83be1d1190b9515469637801d5fa9fe9f55a06dc1c55"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.720/veryfront-linux-x64"
      sha256 "94cea16242d0b54358f75876d67ae5c8fb4d3432ff14816d743825c4cdc8e453"
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
