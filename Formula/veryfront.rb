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
  version "0.1.303"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.303/veryfront-macos-arm64"
      sha256 "bb668be108eb544edcc9d2cfaf8500496883d30565047d6ce5c750b907f637bf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.303/veryfront-macos-x64"
      sha256 "eb9bee647382d3efa1332ecc533de6b8c273452f834354515bcb62e84e019419"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.303/veryfront-linux-arm64"
      sha256 "9153d4cbae1d0ddbac4b4dda5dccec5f11387bbfba69f9c997160173a85f10dd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.303/veryfront-linux-x64"
      sha256 "fc6f1f7de0c0db30bccb3febc7bbc44264f5f476cd3bf10b9227d3d63de44089"
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
