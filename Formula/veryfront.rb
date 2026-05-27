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
  version "0.1.600"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.600/veryfront-macos-arm64"
      sha256 "06bfc9e04521a1ec521795770de8eaa5b7bbe95fd31a9230a898ddeac2e3c250"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.600/veryfront-macos-x64"
      sha256 "c464da4f052632d58457b68721432b599aa94a15faa4cf61179ffdeeb08b89b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.600/veryfront-linux-arm64"
      sha256 "a1f47f3a714cfc809c43fa533e826d1356bf493871f022933747d327617de24f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.600/veryfront-linux-x64"
      sha256 "f0d1f47b939b190e79ec9d63129d33e06d20a2882cac3ce4d4c7a8916a2749ea"
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
