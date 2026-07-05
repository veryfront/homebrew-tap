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
  version "0.1.1011"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1011/veryfront-macos-arm64"
      sha256 "bbfe43f493c9259782d27896c36e2535ae3b590cc629e9e501985b5c9a39ef44"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1011/veryfront-macos-x64"
      sha256 "0272c96af49ec5ff27a68129e28d805ce17e67c6c32acfe2679d59783db2e1cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1011/veryfront-linux-arm64"
      sha256 "f5aba1fe085aa9b0bacaceea5df060a500c42ccc7c5ecf815352b21b3ee24eec"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1011/veryfront-linux-x64"
      sha256 "e2acb270ee8e0c2c6973d883decc0f9c7cdbc1431e3fa123fb70a9e03a0bd4a7"
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
