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
  version "0.1.487"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.487/veryfront-macos-arm64"
      sha256 "57376d38ebfbcc27bf4b0c7be946b2f6cee135b832fe773709d7a3aa4e584e1d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.487/veryfront-macos-x64"
      sha256 "20c9884d7d06eadc6c5f9889b696a2a464311d3e3494c9706914de08d0d4eeb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.487/veryfront-linux-arm64"
      sha256 "6dfc080f2cec12317ee71d4143891459cf4ef5253387f4d58244f03c2c5b2cc1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.487/veryfront-linux-x64"
      sha256 "aca63642f86cc61657144b05991a056ceab837cccf7c3fd7ff8bbdde8e05bce5"
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
