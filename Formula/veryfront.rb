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
  version "0.1.46"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.46/veryfront-macos-arm64"
      sha256 "0bf6f01df4f61748855059a4b349883c9d5abfcc58a313ad6d42d30c2cefdf5f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.46/veryfront-macos-x64"
      sha256 "46c05b945e794d4b82c662f8faa8c8a7c9c6f57ed2ac0ab6be3a407e55a189a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.46/veryfront-linux-arm64"
      sha256 "50598451a6954aa34e9c223be52332a1abc023a3ca6086a604ad61b73bda64a6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.46/veryfront-linux-x64"
      sha256 "512b47e43aadd304d3b2df3180994a178fcb2c504a246441b754b93b0254cb30"
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
