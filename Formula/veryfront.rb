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
  version "0.1.363"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.363/veryfront-macos-arm64"
      sha256 "e7a7c201f26c5787cecdce1cce8a25071525ef795b165abf0a7578a728c88cab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.363/veryfront-macos-x64"
      sha256 "ba42f06ed544401f4cee6979a7bf2c6a376c345f117e0edd32a0be83f5dcda0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.363/veryfront-linux-arm64"
      sha256 "85f8ed390b4eb49351a1026f72070a6001b5bd47767aa5dc741d7382004b6406"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.363/veryfront-linux-x64"
      sha256 "ba2f4913d2ccbc8a470204b9485eb95430f4ab0af03a1c59de407ca9cf007f3f"
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
