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
  version "0.1.21"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.21/veryfront-macos-arm64"
      sha256 "e9f2679bddb4c3fea590bc19f81819785c7810211fef31e934ceaecb0e2938a8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.21/veryfront-macos-x64"
      sha256 "1984c6575f4cf5ba037f88e427cef5d1471437c46d94eecadf733c64af888401"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.21/veryfront-linux-arm64"
      sha256 "37fddde9260ad628b58a89f9df4ed0f31ca264125e756b4d1ac726eef94a97d6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.21/veryfront-linux-x64"
      sha256 "3f516666e37aa944e47f1bd9677bb7aeb60ae3dbee13a54f74feddb77126aa76"
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
