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
  version "0.1.1117"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1117/veryfront-macos-arm64"
      sha256 "07c11c8f255807f56aa4fac1fd9cc019fc917a159cdc90cbf122a4e469107fcc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1117/veryfront-macos-x64"
      sha256 "64eaafc3f0052ad8bc418e1919cfc97b702cc3cf8fedbcdae042a4ed9df41e4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1117/veryfront-linux-arm64"
      sha256 "6a34e6ff305e12d56fd21e2cc7d45cdeaf4b0d6a43450ffb13ceae5792dbf3ae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1117/veryfront-linux-x64"
      sha256 "8d96bb403296b47a0a3e2edab28562692cd617b1d47cb7d09d2191ae764099bd"
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
