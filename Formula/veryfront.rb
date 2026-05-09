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
  version "0.1.455"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.455/veryfront-macos-arm64"
      sha256 "745888e7b6e26ddf56a7a2b9359c72d76dc5922b3198f4762f60e7e4102b22a1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.455/veryfront-macos-x64"
      sha256 "0d72aa0707cbec18accb65abcbebb885c6dd65d9519779a668ee875d7fbe0395"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.455/veryfront-linux-arm64"
      sha256 "273c284e4c51d25cf4ae93b9b85e912f5c205b020f6d3d2338727bbe30821b7e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.455/veryfront-linux-x64"
      sha256 "fe154a74695dade52c3a2fa6f92236eaa3f1d3afeef028929da7c41e40c10ccd"
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
