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
  version "0.1.343"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.343/veryfront-macos-arm64"
      sha256 "c4d63a0c4d1019cccc689089c5fb3ebd07c335fb55e72bc03d94264d5dee9fd9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.343/veryfront-macos-x64"
      sha256 "8ca55def2d5651d5d2a179c0aadd95dc5810585ad6b6eafea1dc5ceedeee494d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.343/veryfront-linux-arm64"
      sha256 "7a20f0f4f5408871367ce655152e84302ef8c7e98a8cc01093b98b3706dbaf1c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.343/veryfront-linux-x64"
      sha256 "0036184a5184e8c61994b66382a754b67b8fbbab7d072003a0c46f9bb1e2b560"
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
