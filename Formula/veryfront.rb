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
  version "0.1.872"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.872/veryfront-macos-arm64"
      sha256 "7300cb20f6fb7c6330f053ba3509b509dafabe953dc63e368987500b59c78ba9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.872/veryfront-macos-x64"
      sha256 "252b076cceb7055aec1c10b8817f80d716558f66f7e4378b8e9c378f191603aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.872/veryfront-linux-arm64"
      sha256 "6a8505de75d07d10e0a746284431e6c964fad8a67d0ea4cafb56a1ab3ccb872e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.872/veryfront-linux-x64"
      sha256 "ba408a29881a91bd474a34cc7af1b29401a4e0ab5de952b3b36495dff8588930"
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
