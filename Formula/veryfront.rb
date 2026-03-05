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
  version "0.1.47"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.47/veryfront-macos-arm64"
      sha256 "eb49a682cd126967aea0844522b4838602bb1a89b7de2438354075709b3fd49a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.47/veryfront-macos-x64"
      sha256 "88a58a7445186f54bb662cbeba21570793bbd76a8cef4a077741065b801ceadd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.47/veryfront-linux-arm64"
      sha256 "14b0f16c19226de76de844c11ede5ef41d4e3abb457271118116261aa3c78c65"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.47/veryfront-linux-x64"
      sha256 "bfb72984c1447f63a9cbe7df85ee77dc7a1adb3d52c6bd314b2aef23834557bd"
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
