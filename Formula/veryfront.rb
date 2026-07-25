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
  version "0.1.1132"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1132/veryfront-macos-arm64"
      sha256 "dfa6953193200fa84e4bc64d3c9967ed6ca909be19291cfa07fab7528b316e6b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1132/veryfront-macos-x64"
      sha256 "d8e5b513dda51cdcac12a3d860c5145f6428a0fb348fa606a693fa6d4d85cf4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1132/veryfront-linux-arm64"
      sha256 "944b6daa4962eb66424ce9b89bf706155744aedb3e16879a214921ab87f36401"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1132/veryfront-linux-x64"
      sha256 "ec31f19ca4a5a08e260a66b20dd526fdbf51a244ccd5a79462cbfcd198b0698b"
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
