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
  version "0.1.861"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.861/veryfront-macos-arm64"
      sha256 "c4a1e2a9cd125cbd459bff917b269fd287f609675b0d92b46de4d39481823c53"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.861/veryfront-macos-x64"
      sha256 "8ee6801dd3605256d8b3ee561a0d8a7c5d993ca6c025fc25f3924e33a72110ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.861/veryfront-linux-arm64"
      sha256 "98f1805f8d8c8ff9c3d3bb85e2a844147d71771ab8d4a0eba88b7ad235576d79"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.861/veryfront-linux-x64"
      sha256 "e81e66a1957e2fa831dfc5a3bc6fec990fa7b7ae13d5e8ac914147e9ee488a3e"
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
