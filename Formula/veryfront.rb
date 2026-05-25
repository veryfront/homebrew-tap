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
  version "0.1.591"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.591/veryfront-macos-arm64"
      sha256 "70d95e93c81f729e8c614ede6f66456900b49d31675adbb0baaddaceee3bb3bf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.591/veryfront-macos-x64"
      sha256 "6986fdeeb09d4f85c6a4967cf47c063e006ae731a842195edae98ab1ba5ffa5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.591/veryfront-linux-arm64"
      sha256 "454e277045e6e89a17e047b91bad1b8c97c5ae35414cd5dac1f680ea246487f1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.591/veryfront-linux-x64"
      sha256 "ca667552136273142243947e1eb60f904c48b966dbc5493d174e82bd8910945c"
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
