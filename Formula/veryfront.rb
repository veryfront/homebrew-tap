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
  version "0.1.100"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.100/veryfront-macos-arm64"
      sha256 "fc2f4a5b4dcd87cdcb8c4de7442f9d5c5e04b7452be253a29a1bdec8e0627e5e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.100/veryfront-macos-x64"
      sha256 "460ba14b7b8de78ebff711fa7a6387d06eb2f1dde082745858baca3b9a02cc0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.100/veryfront-linux-arm64"
      sha256 "c8d6b70faf3e5b2eef5fa072d1634b55af5e98d1b01b1c5b0b0edeff57a75fb4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.100/veryfront-linux-x64"
      sha256 "280f06c8861422e4f2827a381d74f21d799f3630499e2e79ea50b6aa11db47e7"
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
