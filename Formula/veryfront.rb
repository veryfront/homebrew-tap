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
  version "0.1.815"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.815/veryfront-macos-arm64"
      sha256 "caf161a21d0fc8bc2e50d7bf43511d4871e649ddce5efdd7f5893e89cf802bcb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.815/veryfront-macos-x64"
      sha256 "d50dfba202943d28e641e695e5915b67d4bd83c220ec3953ca6522639620b648"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.815/veryfront-linux-arm64"
      sha256 "aced587c346a3deea06cc62e06a2ee8224302d4a02a27b3efa1c64ae3f5f34d5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.815/veryfront-linux-x64"
      sha256 "d317ac70d66b686e3e39f49fecbf23f650fd55cd91ec414e6957f894e4c97948"
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
