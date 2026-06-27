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
  version "0.1.948"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.948/veryfront-macos-arm64"
      sha256 "b511bddec354681c160c22343cad69dcaa6c2e603e14a3e6aa2e172da43820ff"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.948/veryfront-macos-x64"
      sha256 "cb465db38b0c866e6dcfffb9e849c97c6b11833d8ea775a5fdec00a52c870d17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.948/veryfront-linux-arm64"
      sha256 "fb163bf91c03e87dacbcd6f976a987c2f493bd0c68ebed0b436b3dbb052f8f59"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.948/veryfront-linux-x64"
      sha256 "bbb2d0cd775ddd378fafdb45fe136d5d1ac04d7f7e2154f7c7e95ffba5c7fb9f"
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
