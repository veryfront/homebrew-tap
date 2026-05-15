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
  version "0.1.533"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.533/veryfront-macos-arm64"
      sha256 "11c7e312e757f4f7dfe268ba7cfdb379e89795628c78ad39805e574a062cfc1b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.533/veryfront-macos-x64"
      sha256 "4666df407673443cc9acfd7577c84c1b2381fd9e645fcc3c50d44af874c6545b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.533/veryfront-linux-arm64"
      sha256 "c8ca20f75a912a96770d0b98daaea6a164cd5f5fdc31da5692926e55a17602a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.533/veryfront-linux-x64"
      sha256 "2661aa5255d3592ac8a249a4084c0edd2e6f5423f34170ed563c9cd8071af9e6"
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
