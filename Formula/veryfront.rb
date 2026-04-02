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
  version "0.1.130"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.130/veryfront-macos-arm64"
      sha256 "d6f80159642277d0b8d110482821f06a433dfda68828ebd77a0287e11a1cac3e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.130/veryfront-macos-x64"
      sha256 "e809a2c1ad42b02a02d32fe08e01cdbf6ff9bd17a1c51d81e79d868972e087d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.130/veryfront-linux-arm64"
      sha256 "8fdfab669c949192d239f4ab6e34e69f5c2185614dfab8c04dbd1bce58f054d7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.130/veryfront-linux-x64"
      sha256 "a9b9113d5369ec8f6cbaaceeab3ce9d041ba9e3b00623d532bc585682f6ab375"
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
