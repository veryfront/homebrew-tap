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
  version "0.1.295"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.295/veryfront-macos-arm64"
      sha256 "32527b77ec84f5792ea6b430e62c680894ce0b1db197b4c9c3ba8ea1b1df8d1d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.295/veryfront-macos-x64"
      sha256 "2253bf2c52a3e383e48f0b4941ab6ae7ad9c912334be84ef4664f67697842b7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.295/veryfront-linux-arm64"
      sha256 "aa2486544c5a3ce9aa127c22e90dd3d97c94e5335d8bb0638b68c79d7dccc638"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.295/veryfront-linux-x64"
      sha256 "bc1d42daa7751f521dbf18837b686e3e73f3515bd122fe900c48b761aaadc5e8"
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
