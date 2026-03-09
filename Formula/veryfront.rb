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
  version "0.1.51"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.51/veryfront-macos-arm64"
      sha256 "ca05d335b9c741b39f6eab5ddcd0c6fa9f631387ab5015f21777e5bf24d4731f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.51/veryfront-macos-x64"
      sha256 "df372ed8f0d1926ef9589a58d70711dcb9576917639dd4840805ee6f66950c23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.51/veryfront-linux-arm64"
      sha256 "f0397ce7e78428bb6b3bddad496334534ef5f8ff3a0a2999ac58704833ea0a03"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.51/veryfront-linux-x64"
      sha256 "94b6bbedd537dd2c40ec556fbf14df5e01dc50581186fed3285e683bdea393da"
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
