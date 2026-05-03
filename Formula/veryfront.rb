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
  version "0.1.361"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.361/veryfront-macos-arm64"
      sha256 "9c7bafcb263894604c314b89f3446d2349e17bf43d2b67fbb1008bd8cb11b921"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.361/veryfront-macos-x64"
      sha256 "998f57035d0ecc07218873c911701167eac0489f847167cd4caf8fb292180b39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.361/veryfront-linux-arm64"
      sha256 "9e5a5193b197138542bcd849ec9157758e5c9129b93460c1e23263492fabeda9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.361/veryfront-linux-x64"
      sha256 "7b0e14c75560472bfb53f14ee556ebb4e27126eae110bb4c9c9effa2109f4b98"
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
