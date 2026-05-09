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
  version "0.1.458"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.458/veryfront-macos-arm64"
      sha256 "7b9b3ebbe9072af8106a14817e168eea8411a8ca5e612c70e051b8a937c0c33e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.458/veryfront-macos-x64"
      sha256 "6d147c0dc69ca7141649bd33475763d62115cf9bf333f269a3e4f23141730b77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.458/veryfront-linux-arm64"
      sha256 "89033eaf8d7171500a336dc71c16cf7122cd682016d2683e5bd1af11196da856"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.458/veryfront-linux-x64"
      sha256 "9c64f956b3feee43948e2af50b6795e34c5abb5ba345b9133d38d71729db57bf"
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
