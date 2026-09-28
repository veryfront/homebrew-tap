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
  version "0.1.1265"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1265/veryfront-macos-arm64"
      sha256 "994d01f427ee0389d473ea1dcbe06aeb9fbd9aaaa05a96cb5fe0bcb291b8f1ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1265/veryfront-macos-x64"
      sha256 "47875682f45a368b58ba4497d48e43e9452fc51781ce24833a80dfc1ca563081"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1265/veryfront-linux-arm64"
      sha256 "8787f683a07f16f2f06cfdf6222cb552c44a4f1620e425a43d9ea79f56350360"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1265/veryfront-linux-x64"
      sha256 "b17942ed7e9307b350ec92c206579f5979ffa1878779a6328a79d7f6d80928b1"
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
