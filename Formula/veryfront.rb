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
  version "0.1.639"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.639/veryfront-macos-arm64"
      sha256 "f57b6e4155e2431666ee9e9d0e8487fdf25dfc0234e960e5c31c880de719c69c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.639/veryfront-macos-x64"
      sha256 "b3db112f039f4c795155ed78d2ba0a3e3d6773ff91130e0db3ef64e7a64f3dd5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.639/veryfront-linux-arm64"
      sha256 "7fb7ba848750de51473fc34abcc56d90d623668c1574c906ba1b035334711af1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.639/veryfront-linux-x64"
      sha256 "50368018598b76bb3e50ba244eaf945250df70f9746cbb1cd7166cd3cbeb06bb"
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
