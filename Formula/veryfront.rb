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
  version "0.1.340"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.340/veryfront-macos-arm64"
      sha256 "043c683bb6af1f1275fc2c57e83c85e9e5570edd14042b7059e279a2baa8437d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.340/veryfront-macos-x64"
      sha256 "d183d9bab8f4265940d6de5521fefe4143a3f8255030ed5fd4d11afa641d208e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.340/veryfront-linux-arm64"
      sha256 "1c154e256fca7c84be6cf4627231d37b2c6395ecc580d3114fbed945a9777ce7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.340/veryfront-linux-x64"
      sha256 "9cfe4c53ea6464110d74796c7c80639001e508cba32865126de9a86a28bd4bd6"
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
