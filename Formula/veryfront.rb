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
  version "0.1.327"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.327/veryfront-macos-arm64"
      sha256 "82572bb7fe5d071827194f8cb328897a27a7623b157baa3c97ad6fe88a15004c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.327/veryfront-macos-x64"
      sha256 "21d227edf3ef4ebf58e344b7c0dface08817601333557c440c0e4a9249f17cd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.327/veryfront-linux-arm64"
      sha256 "7226224adf97099fb5085c59336d4959b16406bb9a37472cf99d98ec58015017"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.327/veryfront-linux-x64"
      sha256 "c36ff1868542239f0aaa91bf46469176dc0eebbde91ccfb2d6f13e84486a1ad3"
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
