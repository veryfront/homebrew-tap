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
  version "0.1.848"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.848/veryfront-macos-arm64"
      sha256 "016c70c4a2cd7f18de3517535e20c2d4a534fb6687bad329e0c9185782b67248"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.848/veryfront-macos-x64"
      sha256 "60de3251208373b16c365022ba4e06bd5f7b451dd0089b7e521ccec69dc58118"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.848/veryfront-linux-arm64"
      sha256 "a7d002583123bab67a57a39644cb8aec1d5d66e97c4f2e6d662be88c577bb04b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.848/veryfront-linux-x64"
      sha256 "8386e588a8727c75a409ffa9338f0a86c2a323213197e0e28f8e80f0fdb974eb"
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
