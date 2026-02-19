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
  version "0.1.17"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.17/veryfront-macos-arm64"
      sha256 "dd633555e9ce4ef9ffa89a143ed3364efd4d436ebfe90aaaeaa23db26f72d87f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.17/veryfront-macos-x64"
      sha256 "e3156f6ab574dea66e45c4150b42dacc7023b269145a57b0be4a3e78463fc8eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.17/veryfront-linux-arm64"
      sha256 "00b57cc1e3ed2d3c71e9c261b2cc93ad1fc67e8974ccfbe097d4208d4f22e214"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.17/veryfront-linux-x64"
      sha256 "e80e512bfb2c477730769894ea0874d47469051f627dc46fdd9208a2acb17f9d"
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
