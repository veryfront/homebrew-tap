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
  version "0.1.913"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.913/veryfront-macos-arm64"
      sha256 "d96ced94415d6c408ac04323558473794507e0c34f6a0ca0567f110418a6fbae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.913/veryfront-macos-x64"
      sha256 "3e719261c3887766417797270b02cd92195afa10409c774b3cff86edb72d5354"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.913/veryfront-linux-arm64"
      sha256 "d6df813c1c38ffb4870f55876206ccb0dc2df5e6fd0e564e8c01f5ee927e298c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.913/veryfront-linux-x64"
      sha256 "021d23fe136d7e699759b9ca6e5560d6896c719ccc2c94b72b58ffe5be4367e1"
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
