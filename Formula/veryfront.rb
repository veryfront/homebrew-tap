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
  version "0.1.679"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.679/veryfront-macos-arm64"
      sha256 "9eb2c986f3d9cd1556b05a6591233481c91be3c6b9a99d9ec39e2f6708a5cdcd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.679/veryfront-macos-x64"
      sha256 "0c2551eb45d0046a273692e3f6feaa96e7b2767721ef1704928a3cc1dec85fa4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.679/veryfront-linux-arm64"
      sha256 "09234ad67614aee83d18bf541e7822c46fb69519a3ba6bd858fb8495a971402a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.679/veryfront-linux-x64"
      sha256 "6db9788efe389ecc0b1198a8f3aace75993733d37603a973a3e17ba4932a4d38"
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
