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
  version "0.1.1276"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1276/veryfront-macos-arm64"
      sha256 "feb8339c2f1b5d713bb653f7870c20bf829b0a0ba0396b1504b22235767610c3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1276/veryfront-macos-x64"
      sha256 "d6a82f4b375a37996584d41ef311419eaab0db2b21830d01a7ab39e8774546d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1276/veryfront-linux-arm64"
      sha256 "ea2ca18dee237784d36be97fb814eff11334b99eeb392b5b0869299cc07b7c60"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1276/veryfront-linux-x64"
      sha256 "d201b374027fbbb96b364e320426016a83ad1b90d417a0b40099f9ea18c4a7a2"
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
