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
  version "0.1.992"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.992/veryfront-macos-arm64"
      sha256 "108e8b966de611b631d2f5f2486834fea65414c45f699b9838ab5ccd796cccbb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.992/veryfront-macos-x64"
      sha256 "1cce163b7b3c90b1bfbe447a3071fbbc13c21e6caafaec1b6b492ecb69f7a433"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.992/veryfront-linux-arm64"
      sha256 "b055a19d4679033aca33e420cfbd563add5a129e9f405e0e480ec43b84366a11"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.992/veryfront-linux-x64"
      sha256 "6d03ee32024d321e51f38cba46e2802e32a2b7b02c24da63e7aed9aa5ec5118f"
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
