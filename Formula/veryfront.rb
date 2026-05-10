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
  version "0.1.463"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.463/veryfront-macos-arm64"
      sha256 "7431b995baabf48a65308ba06b84bb7fda8a6424907ebdd5a2805aade981d1d5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.463/veryfront-macos-x64"
      sha256 "8f738cc92481edbf03d37a32883c1769e0810113478611ebc424d6b6ecb3ad5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.463/veryfront-linux-arm64"
      sha256 "17328dca4aee57d891918982e0391e684fda8546412f2eed0e72878fd9358aa2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.463/veryfront-linux-x64"
      sha256 "6aded64e27c32e2b0346d57dfbc7734f210ce3a82cd11ce0ea37c8a07c90cb79"
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
