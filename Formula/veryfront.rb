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
  version "0.1.1062"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1062/veryfront-macos-arm64"
      sha256 "d345228091fa530b85cfae46aba88fec1e6e296c31a11fefd5216ba4f71dffe0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1062/veryfront-macos-x64"
      sha256 "7670279266ef7782685d2daef49a3a0fbf4faa24730391a46290a34ef0af8b3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1062/veryfront-linux-arm64"
      sha256 "29fd74d7105dffa4afcb94e060c2c20648a2aafefe8bf175762f18838fa7920b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1062/veryfront-linux-x64"
      sha256 "fe4b883aa7583cc86455f8ffa2ca95bc6716c6e2379a67f8bbb0debb1baa5eb8"
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
