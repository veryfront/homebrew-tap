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
  version "0.1.1109"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1109/veryfront-macos-arm64"
      sha256 "2d727c073fdf21caf43a4a12ffefdb5d4d94681698d63c83224288603c87de3c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1109/veryfront-macos-x64"
      sha256 "08febe8c5d6463634cca2917893c1ae9272ef1ff6762ba1a416b5604b5ef3c44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1109/veryfront-linux-arm64"
      sha256 "2c7df670e3245dd4db2ea24fcba52f5c12960cec4d5f5644ce251a78b3d27751"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1109/veryfront-linux-x64"
      sha256 "c93ec345c6e804f10e16bdfb30f4a5ab7a622ff3bd94bd6b6896e5df2e5e0628"
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
