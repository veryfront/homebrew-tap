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
  version "0.1.745"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.745/veryfront-macos-arm64"
      sha256 "a3cad5499b799650938038ac1a61964fcab92696a9dce73525c31b4ccde02030"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.745/veryfront-macos-x64"
      sha256 "43159548a6df82ff1693c9dbb3f06ec9f7f6a9eb45128618946686626fb33079"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.745/veryfront-linux-arm64"
      sha256 "9454db7938dc79d14a423287c6c297c7e1eab0d3a2322e8a8180454a5e81abef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.745/veryfront-linux-x64"
      sha256 "ef4c4ff5eb3819d60c9f8e5cb4af5419c805a52b2c36ddcaeaec7f2c851b2630"
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
