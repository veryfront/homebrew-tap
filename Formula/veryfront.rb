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
  version "0.1.450"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.450/veryfront-macos-arm64"
      sha256 "2068c7df7fb3a979b1f25342e8b73eade9d1710cea08aae0830cf531a33fce7e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.450/veryfront-macos-x64"
      sha256 "0fd1dad5a9af85351af1623d79b0f29de3bf8ef33d4d6f6f37b3bf9008b143ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.450/veryfront-linux-arm64"
      sha256 "d76d2b7bfabb2caf06e38c6040740ca85bdb8bb8f0441fc6df89eb036e89c92f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.450/veryfront-linux-x64"
      sha256 "85687c04593509a8d452694ff37a11d057bf5d82d9c8a92c285586c0117f934f"
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
