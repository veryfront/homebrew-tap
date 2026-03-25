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
  version "0.1.104"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.104/veryfront-macos-arm64"
      sha256 "62c9ebcb5a5c48a4e9c53890bc4e221cef24b8b1a8863f60d01d0179ff309850"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.104/veryfront-macos-x64"
      sha256 "a68045c3b017e43ac9286ff84c803b8bb3559e937dcef0eb5d080d7616302ed3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.104/veryfront-linux-arm64"
      sha256 "33194ddffdb07fcb4551c87a04c0c31ec8041d5738627fbf7ec9a6b8d738f0ba"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.104/veryfront-linux-x64"
      sha256 "d6fa8cda13ba5305b514fb66d7f39ca64e8aa6268d36224669cac2cd2800665f"
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
