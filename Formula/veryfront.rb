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
  version "0.1.38"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.38/veryfront-macos-arm64"
      sha256 "2418481522d23da9ca57d7e50d6203ab23d2c6adb605d7925087b28f05bbc292"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.38/veryfront-macos-x64"
      sha256 "d1432ec5bb5f40cc756ac8a595f6881d711071d94cdfa1955bbb85f021bc1ce9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.38/veryfront-linux-arm64"
      sha256 "70bf3a3fe98cf6cbd379711d6b23729b1610ace4fbd6160c4a2313fa6357d6c9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.38/veryfront-linux-x64"
      sha256 "ab61adac33a3c697df25f32702d590c74681c92b73c9616738f0a58de25d7a4b"
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
