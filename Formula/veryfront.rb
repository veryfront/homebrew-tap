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
  version "0.1.267"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.267/veryfront-macos-arm64"
      sha256 "7a9496ca1075848ae6498d638bfe848bbbb7870da487470d6629041be4e41cdd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.267/veryfront-macos-x64"
      sha256 "6f886c8afe473092c7fe9d050b8e698fa819485c44c16ccbdc616bdf4ccaae8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.267/veryfront-linux-arm64"
      sha256 "776b60ab4305addb609844228bba7a42981a8e9f29ce2c81943e4290f2ee275a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.267/veryfront-linux-x64"
      sha256 "dfe8bc6eacc1c74ba230c9e43d80c606fa30e564efcbb4f086663fbc5568f1c0"
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
