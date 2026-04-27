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
  version "0.1.288"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.288/veryfront-macos-arm64"
      sha256 "6cfed3bc635477d0e8dd0b2a8a2fafa44d1469d443837fd188bf5405f8ea6a25"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.288/veryfront-macos-x64"
      sha256 "21bcea7d71c7d491424546a335ed6edfd4af06c58503b0b7b26729390ef9d45a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.288/veryfront-linux-arm64"
      sha256 "a004afdaf1bad44188a05e969cfb1c8eabac594bde0532b617bdc67ed064d003"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.288/veryfront-linux-x64"
      sha256 "2291c42679c979cab9105f701a3692a46a8e55c5111ba5ab22a2bd6737607441"
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
