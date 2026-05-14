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
  version "0.1.520"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.520/veryfront-macos-arm64"
      sha256 "23a4e928ea466163d5e3d384f50e0a826d06442fe7a9b2f9467fd38aaecccf44"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.520/veryfront-macos-x64"
      sha256 "b65066f57527e406d27ab12252e3166cf0e9b68a1c608e280680b2944d3bf124"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.520/veryfront-linux-arm64"
      sha256 "c3efb1594ab75bdb68688733df4c9b5732d40ae77d351f0c4751952d7d9c19e5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.520/veryfront-linux-x64"
      sha256 "e831284f9ad147e6f932ff9b76bb9d854d2eabd5f6caf0e30fa99ba0db307496"
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
