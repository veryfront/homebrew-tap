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
  version "0.1.1285"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1285/veryfront-macos-arm64"
      sha256 "cbe986b623cea38bb4f69426b6720067ec4bd23ec9f9178ea4413651914cac48"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1285/veryfront-macos-x64"
      sha256 "22a401c7371e5195dd4afe4165fa676422d264ce0a71a2b19a14c280f3bf932d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1285/veryfront-linux-arm64"
      sha256 "9d1bc983b958e367c9242c3da92ea0af055d6a05191285115f26e5552803af53"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1285/veryfront-linux-x64"
      sha256 "dc32e96b53ee8d486caaad69f6473fdb30f94d0f4052c2d73f04403788fec89e"
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
