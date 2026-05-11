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
  version "0.1.477"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.477/veryfront-macos-arm64"
      sha256 "9ad704dd114a6c7b539ce21c02acde707f84f6ac39b7fb0fb212e1079cc2c1fb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.477/veryfront-macos-x64"
      sha256 "0f2a2d8e3015e9d86fe3083d86a4b86053bf8b08825823e42ba5a9d2bf016024"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.477/veryfront-linux-arm64"
      sha256 "9506047cd47d30d7c4034ef02c6a8fb9b6e416ad8701451568b83ba385dbb429"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.477/veryfront-linux-x64"
      sha256 "11ca03345d62d3169d17bb57755cc215d46180c635871d0c143b53141d1bde9b"
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
