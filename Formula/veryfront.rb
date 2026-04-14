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
  version "0.1.199"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.199/veryfront-macos-arm64"
      sha256 "2cd2883a5b9593f7d7600e9617e4d3ce585378c3b5fe78068fd7f06c1a019ff1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.199/veryfront-macos-x64"
      sha256 "471ef5e1645bb7ad23dd4307a91f4e92b14ff2860307cb86d84dc77f0d8a7c27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.199/veryfront-linux-arm64"
      sha256 "6ea18a191a57da6a1c37b5b57b11cf0940fd3a6c6daa5e5e0a94c8743ba857c2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.199/veryfront-linux-x64"
      sha256 "d39631dcf8eff02b714e25d6532d1960f305bac736bb23b6cfc2df17a47b000c"
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
