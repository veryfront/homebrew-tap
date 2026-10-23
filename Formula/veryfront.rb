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
  version "0.1.1284"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1284/veryfront-macos-arm64"
      sha256 "35f852d692a6ddf4372c8b56e3e1fb42c5d547229dc16d648ca82428d609fcc8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1284/veryfront-macos-x64"
      sha256 "cec0ee84a7fef080a499403585534d76252caa167fb496c1dac13cffe41d97ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1284/veryfront-linux-arm64"
      sha256 "1d60d0438bc8562419cca86eca8c4c5750cc5a44247e6303c76e89acfbcde760"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1284/veryfront-linux-x64"
      sha256 "25b2b1afe9e909eb35c00e70aa6684e3541219cc01323596772825219b83ea61"
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
