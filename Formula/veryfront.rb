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
  version "0.1.108"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.108/veryfront-macos-arm64"
      sha256 "d14d8928295fff116fbffa646d57181c5edce58fa88687adad1f53e875b653e3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.108/veryfront-macos-x64"
      sha256 "4519d14bf2c2c87b3727839afccfedaef2a33d3fa62f22c44f033a76959d963e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.108/veryfront-linux-arm64"
      sha256 "20af2070db5a98b1304ea02049582d2f8b4647d59d13a76b0489628168b2d09c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.108/veryfront-linux-x64"
      sha256 "2e32e680bdc63bf180a954e3eb733fcc89ecaa89dceb2d2ea1f9f83861493f4c"
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
