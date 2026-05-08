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
  version "0.1.429"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.429/veryfront-macos-arm64"
      sha256 "a6071c9a8e30ca6665a06069ed5278e0c28e91eb0cc132b0e45c8cd5591d2f17"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.429/veryfront-macos-x64"
      sha256 "8fadea44c2ff9c90b1800d5123dbd9e522e6fc6137be201c0f5c751d89853e24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.429/veryfront-linux-arm64"
      sha256 "6b8cf16bd4db2ae4dbc3ccc2288906f9e7cc9929adb744350a019efa15037b81"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.429/veryfront-linux-x64"
      sha256 "b762e6cdd1093df6eb4854b06af52db91dd7467e26c4c9491d2326122ff98bdb"
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
