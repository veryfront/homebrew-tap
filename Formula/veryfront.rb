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
  version "0.1.308"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.308/veryfront-macos-arm64"
      sha256 "25121492dd039c0ee455e73fa0ea9c31445f63e415411ae351c333b07123d02e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.308/veryfront-macos-x64"
      sha256 "7fc7265db5c7af88d0c05a60fe547c9a9c12a0b738126b30e350d8bb4e568229"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.308/veryfront-linux-arm64"
      sha256 "23e3a15eac2d27cee1e5d76ac24027a8d0050619e329b26722b65137321204e1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.308/veryfront-linux-x64"
      sha256 "401195dbd01dcb169907a3a39a944c84999c82196eda59d8e5e0d574be52e0ec"
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
