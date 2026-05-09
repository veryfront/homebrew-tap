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
  version "0.1.447"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.447/veryfront-macos-arm64"
      sha256 "3dd24ff9b4fed1b1fc83c482776c8d0b8efa844f702d3054647e6ef53d50463e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.447/veryfront-macos-x64"
      sha256 "8157d6c42983997fc46d9e0a36e8da9d9a4046c31c8e7d5d5ba3dd7efc3a0057"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.447/veryfront-linux-arm64"
      sha256 "cca0377f073089f35a9440e2e7f4b20b5c43339e748125d304ecbe666c72e340"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.447/veryfront-linux-x64"
      sha256 "0122a432cc76475e51d8d485cd8055fac0292c5ebb37e5e48af479698d232a5e"
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
