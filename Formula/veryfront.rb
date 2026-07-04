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
  version "0.1.1001"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1001/veryfront-macos-arm64"
      sha256 "f613a488d84a6c77c451bcfc64d5caff43530620adbf4c49ea1ea4f8575b1ae0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1001/veryfront-macos-x64"
      sha256 "7907b6cf137c445c0c58f94317696ad3ddeea0f35889b7e0f56001715455e69f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1001/veryfront-linux-arm64"
      sha256 "f7de805789bf10fdf89c4072302fad6e364ef5fde3831bfcc15a1e2befa91577"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1001/veryfront-linux-x64"
      sha256 "c11ea85c8c1be025bc12d70c6b30b77186ee1cf2f1caafa4cbb7c69f123d209d"
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
