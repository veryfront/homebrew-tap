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
  version "0.1.283"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.283/veryfront-macos-arm64"
      sha256 "585b0b6bd070fa1ce47b253c72ff2bf4a8764186d20f45ef76a4d0d0942263ab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.283/veryfront-macos-x64"
      sha256 "9c6835bd66b78826c73b9657b1a414cd3c00d12e89e0a0d13a9ccd12d3d9ead1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.283/veryfront-linux-arm64"
      sha256 "3e01140eb46889f62ff9d2fb3365e164b8925268400ad69d8cf9708cb7fa0842"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.283/veryfront-linux-x64"
      sha256 "9be41fb8431942dbfa5fa8cf802d227cb6163568e4b7553aeac4b6b2c58bc83a"
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
