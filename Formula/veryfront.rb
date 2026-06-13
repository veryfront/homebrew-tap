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
  version "0.1.785"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.785/veryfront-macos-arm64"
      sha256 "bcacc0676466241a6fd91ae9f4a39279e9ed1f32eb55b8770903a84453ae40b7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.785/veryfront-macos-x64"
      sha256 "9a88b0ff86261bed145839fd4a4be5abb9af262182ca5b4a2629392576cbd6e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.785/veryfront-linux-arm64"
      sha256 "e8cdf7965f71a9d9d3b4b4d5b51afe726d11f73d89eb3d7610eb2e97b7200172"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.785/veryfront-linux-x64"
      sha256 "e0063c648bfccd30f987e8b65253abce714de2d0f2c9bd2573fc93c079221a6a"
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
