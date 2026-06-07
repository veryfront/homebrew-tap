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
  version "0.1.682"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.682/veryfront-macos-arm64"
      sha256 "9462c9d062381dd31169b349496652a31e15997e1c51603cc6de8d4e7ef581a5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.682/veryfront-macos-x64"
      sha256 "d539035e905675f2acc5c3db37781cc9c7cde7d53fc580621c45f98947211696"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.682/veryfront-linux-arm64"
      sha256 "201cea7515f0fe5c53aaed441c87e506429a4788fa1b11ab96454d06fb4c654e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.682/veryfront-linux-x64"
      sha256 "5c8b087b052718af4aff4a2590ea8a772e2231e6aa70b6354b8659132a1f2c2b"
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
