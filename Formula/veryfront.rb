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
  version "0.1.333"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.333/veryfront-macos-arm64"
      sha256 "ea34db35384e4453a55123870fcdc1bac968b8ec41f7e34356d7bae4bd1d1e2b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.333/veryfront-macos-x64"
      sha256 "d1d7762aa0e524a9120baaf7ff60abcaa2301dbb5ced1c5fcd57a91321407e09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.333/veryfront-linux-arm64"
      sha256 "c8c1898ca969fa877858c04cb37ce5ad63b0dbf1833dee4012b2d059605f6f29"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.333/veryfront-linux-x64"
      sha256 "618ee19be4c5310f404f40af1cb874ad36b98e9008e713fbf4239ff3981f3545"
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
