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
  version "0.1.329"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.329/veryfront-macos-arm64"
      sha256 "3ac865dde9c716f39beb9574fae0ba9b112c0c4da8c2ab14160c811db46fe7d9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.329/veryfront-macos-x64"
      sha256 "ac27f5a289e9487ccc1f150374196868b0c81d60f5358e8bafbdf872d65eac97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.329/veryfront-linux-arm64"
      sha256 "0f0b42bc759372b10798c1e3588f70f968587b163399212653f2f8c1cf2ed5be"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.329/veryfront-linux-x64"
      sha256 "0411f2117700423ccfe787fb1f2b3a900802eabf7aa4edd0b6b4cc36156bbec9"
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
