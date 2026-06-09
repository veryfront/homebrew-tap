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
  version "0.1.698"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.698/veryfront-macos-arm64"
      sha256 "a4c5fdac571fefa244254b31dfcb667f63e1127ea70e93a27bea1044c6075aab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.698/veryfront-macos-x64"
      sha256 "3f3f2f9192db816e0e9dd8f272e03d67a44fac250ecd4bf62eea02f5805df972"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.698/veryfront-linux-arm64"
      sha256 "d64b72496d94e74bacd3b5d47dd2bd020313632f8dae94dc6f384e953dbd96f9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.698/veryfront-linux-x64"
      sha256 "a5677f364e9839ceb0030acf007f756539f0888e35eb6385b4d30434dc7d220c"
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
