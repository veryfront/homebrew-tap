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
  version "0.1.605"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.605/veryfront-macos-arm64"
      sha256 "ffe769070b2c11471f9ca389d2d73c7af5d2f835dbe10f7d26ed619cc8f775bd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.605/veryfront-macos-x64"
      sha256 "95e4671c9b6ead65f15a87367307fc690e22de77ac7f1723753dde51f639a3c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.605/veryfront-linux-arm64"
      sha256 "a08ad800e897feb2c01a4fa6532bd7e91bd0d81b678400a22278086cf6d04ba0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.605/veryfront-linux-x64"
      sha256 "e49d1475b5d0cfc8a2686acbd28f945e7318eb2c5d3aed1142dd7dfb0d127f28"
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
