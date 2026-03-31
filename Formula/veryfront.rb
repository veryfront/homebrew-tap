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
  version "0.1.115"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.115/veryfront-macos-arm64"
      sha256 "ca9340c6cea2899c84a4c44fa41b8d4b73f4d51ed6385e06dca1ecaefd93966b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.115/veryfront-macos-x64"
      sha256 "be8927096017384913088f23f48e4f318d44f7c8f455faceca812a30752f28ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.115/veryfront-linux-arm64"
      sha256 "c1cf04990c374740c58ef5d17c1e1dab52cf647d15166bb94fd7d1fa6e8f27f2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.115/veryfront-linux-x64"
      sha256 "30bf4f6aa0e397c7ae54429b7550b2ef3f0c1734d21f56b559a31d8d177934b9"
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
