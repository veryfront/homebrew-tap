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
  version "0.1.1241"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1241/veryfront-macos-arm64"
      sha256 "a3afa975d40ede63793b6e5fc56c5782f0e2ac67d5d1c47cb25d3ae33ae0d677"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1241/veryfront-macos-x64"
      sha256 "5c7b1267dac7bd162b8a032fd6ddc7d59d223b92cd5dee9477f55dbc22cb723f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1241/veryfront-linux-arm64"
      sha256 "ee05299593be8f7e98c9d51ecdf569c9a3cfce44c3f60334457f1dcad9268df7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1241/veryfront-linux-x64"
      sha256 "9c25585cde0eca90fe89162c66394417aaec1f2a7c0a77e0afdbe786e0766beb"
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
