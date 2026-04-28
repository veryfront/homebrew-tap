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
  version "0.1.290"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.290/veryfront-macos-arm64"
      sha256 "e38d8c510fd56d7e56656acfec44d30c699a878c51fdf63ee86bebf6bfc065a3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.290/veryfront-macos-x64"
      sha256 "96dd357702adcfb1808eebed7a86e0a8df4806f7a82a459be22b5711f4f786fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.290/veryfront-linux-arm64"
      sha256 "642bb21a1a1289238519bde3f04299d3babe4b4d77fa2fbddf2db051565d9982"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.290/veryfront-linux-x64"
      sha256 "c6bdfbea8a2a01c9bb6ae7ae3fb183f0ffccf345b57e30b306b8fd372708af43"
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
