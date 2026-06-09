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
  version "0.1.722"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.722/veryfront-macos-arm64"
      sha256 "d183ea1a9d52d80037673435ea0c7a7e81f0a81cff3dcac12897bd90a1008f4a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.722/veryfront-macos-x64"
      sha256 "6724d2dc7ca824806642f5e861658a936bff794e46227766015556d181a6d803"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.722/veryfront-linux-arm64"
      sha256 "a4811860016fefa45460ab12fb6cce93668f3c0ab879af57db376987c4ed043a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.722/veryfront-linux-x64"
      sha256 "f861706b0e86ee40f793506deb8cdc59841968d63dd7d59e91b5df60e17d827a"
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
