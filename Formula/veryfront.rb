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
  version "0.1.174"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.174/veryfront-macos-arm64"
      sha256 "f221e303b37bf1bdf17cdf78e6752f550518b4d80f9022e2779d5ded3bf80630"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.174/veryfront-macos-x64"
      sha256 "f5dd1aed72e8202877fa78aac36628e5617a31ab4dbd683750f55895a16de200"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.174/veryfront-linux-arm64"
      sha256 "670abd24ebc5aa39a98cbc844903b04615ba19f54a2b5335252d4409056d3b72"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.174/veryfront-linux-x64"
      sha256 "36d5f4e5f40451aa0ab400324c07bda6d3618001bfe884b6b4b4bccf5ac3152c"
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
