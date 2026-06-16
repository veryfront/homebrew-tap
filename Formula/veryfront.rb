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
  version "0.1.825"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.825/veryfront-macos-arm64"
      sha256 "30158d95132f23d67a7e11247e4d1d2a8a262755bb88dbc5ec4b9e0aea101611"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.825/veryfront-macos-x64"
      sha256 "62d397f75aceb03be7eba630ceca2404a896f5682e5fd48ee5a28c41859c408a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.825/veryfront-linux-arm64"
      sha256 "03e7003536137ef1e1f843a72e495b96bcd7f49cd67c09f68ef766ed2eee6a5c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.825/veryfront-linux-x64"
      sha256 "6e553c573cfb5810ac260e6793c45566eae5c8deb4fbf6e4a52c3c8625713f16"
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
