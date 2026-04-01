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
  version "0.1.117"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.117/veryfront-macos-arm64"
      sha256 "5b61ff131eb5318a3c72581031fc47b181a395a3fb9ff02814e4383c973c989a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.117/veryfront-macos-x64"
      sha256 "e222fe950256510b8225269db200ea142058e1e5501263f006598fd5b5f213ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.117/veryfront-linux-arm64"
      sha256 "61ba5a814b1ddbf4bbb08576de16b671543a05851f4822233c8af14cb827d539"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.117/veryfront-linux-x64"
      sha256 "a7f15a396e7485b6deaf7ff0be20d3b9d465fbc91f29f0d00d77d5078c425a4c"
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
