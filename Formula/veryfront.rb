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
  version "0.1.920"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.920/veryfront-macos-arm64"
      sha256 "951eabb66cc3de5a90ec1cc80676bc5d3a2439080326e821d165f53706f13015"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.920/veryfront-macos-x64"
      sha256 "de06c8540cb25fbdb412fa95359e89d8738d3a9d27b5349e5b40522bbc40ff6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.920/veryfront-linux-arm64"
      sha256 "9c8145ef4cf6f18b26f3958cd7e3f5ff6427beb06f2e4cea2c6ae6a8e5b2994e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.920/veryfront-linux-x64"
      sha256 "06fc39364e525ebd5d871bc16fa03e2bf7f1becda15b396ded538eeb24fec29b"
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
