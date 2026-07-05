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
  version "0.1.1014"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1014/veryfront-macos-arm64"
      sha256 "3bf140567b7bdcc48be2afe60b2efb85387b5ccb652d5a28ae773dc0c9d060bb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1014/veryfront-macos-x64"
      sha256 "d31ce856207693e4677df8cd81092ca01fdc0ac6128ad5c7dd4fe0821d3f46be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1014/veryfront-linux-arm64"
      sha256 "436be6c690214ec5d48fe4c5fbe8da2cc98c5bcfd6f88fbed1c575ff129de84e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1014/veryfront-linux-x64"
      sha256 "d10554befbbe4d4d64bb6ccb3f652fd074d70fe673bdba8134c02bd56e68876e"
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
