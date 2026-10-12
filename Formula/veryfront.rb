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
  version "0.1.1273"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1273/veryfront-macos-arm64"
      sha256 "153146585d92b1374e6268f79ca8fc9a8bb4cefb152507452e9744ad4ccf2e38"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1273/veryfront-macos-x64"
      sha256 "45284f1b1173fcbb34a73d3fb0fe341588f0508527ac3360f8f818013837edad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1273/veryfront-linux-arm64"
      sha256 "1cea5e2a22a257b05c21a0d1fabc8d25904317a344bf82fc60ceba014ce3c95a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1273/veryfront-linux-x64"
      sha256 "c6b22fc45992ebd56837f41f010415506bc06029e36817740fc0384decff73ba"
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
