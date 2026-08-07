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
  version "0.1.1211"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1211/veryfront-macos-arm64"
      sha256 "2de824cc75948e8c67c8cd463280b0998afe239ca4950999a6be59767bfa62bf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1211/veryfront-macos-x64"
      sha256 "a78d297280b437d3789be54f95c874c0d2457f06b49b6417cd60b4951227f0aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1211/veryfront-linux-arm64"
      sha256 "f85b543ed214e05ba150ec53a9bdcdc6c949b168dcd01bfda6d04022fcd63a35"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1211/veryfront-linux-x64"
      sha256 "f8cea29990ef58d519ad0cc4800ec9783fa8b7df27a15c06e426412562fded46"
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
