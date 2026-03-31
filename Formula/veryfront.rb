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
  version "0.1.113"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.113/veryfront-macos-arm64"
      sha256 "c7f3480d87baba26b161c14fe3f8e923135314c51e02322436cdd49a4ff44ccd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.113/veryfront-macos-x64"
      sha256 "61ac7c27ba1fb6e4dc3df348bdfc4b0e002b5e1fdfe7c35eef2318bb565e2d1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.113/veryfront-linux-arm64"
      sha256 "2d4228c2f78cf60ea9a4eca6665d2ab58738bfd9f7717bb94c3b9e2a7ad43276"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.113/veryfront-linux-x64"
      sha256 "785bc0557b2bdffc91172629235f946e80b749a7ba06ecba42eaaf645fea016e"
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
