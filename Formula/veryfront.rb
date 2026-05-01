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
  version "0.1.350"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.350/veryfront-macos-arm64"
      sha256 "c58956f00e4b20d75146f18d61780c5f17c43a7f51114ebe98dc2e99322cbbe7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.350/veryfront-macos-x64"
      sha256 "cd3783f4778c1ff88a25cd6320f6ef36bf1155a061eb56cf814186a6ff5896ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.350/veryfront-linux-arm64"
      sha256 "0416e3cfec0c2a5cc913acdb931d11a89f47e4385cd7028cc9fce37408f4ca8c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.350/veryfront-linux-x64"
      sha256 "0a16643560f3660b1f81eaeb8d38fa59d0d6b5f8c5dc009dbe4f9bc87ab129ab"
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
