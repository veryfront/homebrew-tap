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
  version "0.1.695"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.695/veryfront-macos-arm64"
      sha256 "3ec9960aa58575330e2617eb704e4719a477b2035509333cf545515bc915141c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.695/veryfront-macos-x64"
      sha256 "56e869028dfd1dd3de2cb8ac1dc03d760535dbd69a7f5eb0b0fb904fce22b649"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.695/veryfront-linux-arm64"
      sha256 "205e419836e740e7c008fa87da43cae5c963c4343abf4731cf525acb8be1b531"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.695/veryfront-linux-x64"
      sha256 "9eb010ca05f485708d5a6b37ee2247d03c7ab90abcfa01ee0d56c94f73b40753"
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
