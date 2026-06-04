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
  version "0.1.661"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.661/veryfront-macos-arm64"
      sha256 "412153ef64565872b1638266a9702147fad73d74f4b4b903e4350e1f0179908e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.661/veryfront-macos-x64"
      sha256 "377d7308cae3e3e7d54a398e6a2619ff8e885c1631a7cde387cd340f9c2759e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.661/veryfront-linux-arm64"
      sha256 "f487d266a7dd98e0e9718b6099e715869e27d1f3e017824c9df9e8a954eb9809"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.661/veryfront-linux-x64"
      sha256 "bdec4e82c331140936bc769ec627e0ec51e0535bb4e09dfcff7ec2b37e4e1ddc"
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
