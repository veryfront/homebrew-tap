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
  version "0.1.1182"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1182/veryfront-macos-arm64"
      sha256 "c952120fb47f75b99635542268ee9f1a0ef8f17ab6a7a52358b33a71eaf322f9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1182/veryfront-macos-x64"
      sha256 "38caab978b3658b18cdf5312b380267dfab1c86e078b0060dde7291f57fb7be2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1182/veryfront-linux-arm64"
      sha256 "3d1cb4f048ea21e1b5693f459772a6389b8715332c565f82dc007904c87cbd75"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1182/veryfront-linux-x64"
      sha256 "26eaf790f3793d12dfd2799396b0d4e712d42987f25cfac3f4e00c3182629459"
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
