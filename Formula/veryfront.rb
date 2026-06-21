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
  version "0.1.887"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.887/veryfront-macos-arm64"
      sha256 "c5e3588e81c8c885f9a40deb9c6e88ecea9444ee296642871158f219cea5f778"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.887/veryfront-macos-x64"
      sha256 "32a63ac6821cc7fbb0436409144c6b6e3890e5bbbcd0a613864807503cc0df0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.887/veryfront-linux-arm64"
      sha256 "ddb4efa6c0c7382e40b05843fd5978eb38f59a7cc8983ba1352dba15aa76f920"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.887/veryfront-linux-x64"
      sha256 "d5645237bf2d44a82512411f4d821f491a459280ea0ba7cdc28cbf662e47a3f1"
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
