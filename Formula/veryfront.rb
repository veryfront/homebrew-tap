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
  version "0.1.386"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.386/veryfront-macos-arm64"
      sha256 "37039cfd6fd830225b7e981b80ebb68e6b40bec3865cbbd21940b75bbd321d8f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.386/veryfront-macos-x64"
      sha256 "29165762895bce234982037b5c7a76328676973f86cd9a2ca70703b211d6cafd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.386/veryfront-linux-arm64"
      sha256 "4e21924ebdae16f82e8e4a8f4f0cde3d0883971f665dbfb25e0592e8cfa7fa64"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.386/veryfront-linux-x64"
      sha256 "c8e06955bf2caef095e3d02ae6e968263551aeb8990f35598e633119dbfb1cf0"
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
