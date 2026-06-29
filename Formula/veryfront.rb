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
  version "0.1.975"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.975/veryfront-macos-arm64"
      sha256 "3bd1aa6d7245de6d9669435c5a8465b5761383616eaa1eeedd9cfb9813aff407"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.975/veryfront-macos-x64"
      sha256 "406b6f750c05abd5d19a3f61774f3bde5eafd5d3cc6880d45920c60f107036fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.975/veryfront-linux-arm64"
      sha256 "9e3cd76f80617d7b0b3e0c5f8d059ff7fe18c39e73d465b20540dcb551197cac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.975/veryfront-linux-x64"
      sha256 "d58397fbeba1f0bed778cbe01a186881da660d9b683ee379a65f5429c90cddc5"
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
