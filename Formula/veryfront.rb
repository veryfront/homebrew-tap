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
  version "0.1.610"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.610/veryfront-macos-arm64"
      sha256 "025b35e573e85e0e3857c169802a5fef2ba4d1867b5e932b12966f1d46e339dc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.610/veryfront-macos-x64"
      sha256 "032e050fe5dfdb6990e9678b249ee56c88c9e63ffca87fcac6fdd2160ac67198"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.610/veryfront-linux-arm64"
      sha256 "9af43b96cb2eecd7f725eba0f2bd82a783081faf11747a9f87853c2a72b4f498"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.610/veryfront-linux-x64"
      sha256 "bbd06d5b33053cdee4c69608d4daab391b7933d4c17717601aa672838e34be37"
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
