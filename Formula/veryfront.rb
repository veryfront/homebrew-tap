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
  version "0.1.311"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.311/veryfront-macos-arm64"
      sha256 "ad4d3d385fd8ea05d09d69176c0ba057e8d8e203764c1bd52e00f5ad401e0183"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.311/veryfront-macos-x64"
      sha256 "427c4a9a9542abcf8d9b02903479669c41ca037f2eb9bd25fb91fca2c4931677"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.311/veryfront-linux-arm64"
      sha256 "b37e15ebe8a2552a084114966166417b5e3f6c557d5941e9bfe3c2b20756cf03"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.311/veryfront-linux-x64"
      sha256 "fbf34e2d98f27f18cc179fe1dea087eb091909df2dc00ff62cad9037cc90434a"
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
