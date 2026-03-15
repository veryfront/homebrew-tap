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
  version "0.1.65"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.65/veryfront-macos-arm64"
      sha256 "9b7d5e9a3835fdf2610d6f7809257e573dc2711bae5e4962312a409ba5107bb9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.65/veryfront-macos-x64"
      sha256 "d2f8b384dfa474f096f59a5e4fb1fe706bdb11ae9c06a9f5b94c2c5d9027b5c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.65/veryfront-linux-arm64"
      sha256 "183ee8705d50664c138e7533202593062c6649a91129a6e60181984b2cd76b1c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.65/veryfront-linux-x64"
      sha256 "c542484f378224d9ef4aa60d4e18719b58eacf943d648a95cefe96b9b0031b5c"
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
