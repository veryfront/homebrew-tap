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
  version "0.1.1002"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1002/veryfront-macos-arm64"
      sha256 "c029d52e48e632a87d431c5bdd2daa51b9edc8e45c643bf2bc2390c00b6fa603"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1002/veryfront-macos-x64"
      sha256 "d048725b6ba14c922b1626b11722b1db059a20a3c62d971960b7e57217f638aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1002/veryfront-linux-arm64"
      sha256 "1154ad151172e8eb3064eeaea9062f552b23afdf61ae65d7d041f178ccfa5fb9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1002/veryfront-linux-x64"
      sha256 "852408739e11a8555d176ac96c61ceb91d4ac0fb92e9ba8029b3e7f8c7e7d24e"
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
