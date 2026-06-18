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
  version "0.1.849"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.849/veryfront-macos-arm64"
      sha256 "2cc7b791ece4f841c88e8b05e37834eeaecc44459b467433a0b75224b8d0699b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.849/veryfront-macos-x64"
      sha256 "09d438f89afcaba7e397e3e6025b90a8f6a65962096529556d015c38f6b0646b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.849/veryfront-linux-arm64"
      sha256 "388b4bbb6303bfa0ad28c0177933d61a085e1121028cf1b93858a1425ce31007"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.849/veryfront-linux-x64"
      sha256 "2437ab7a7546f3a6ac161d41f1d4222d72072eb9e2c53bfc7edeb24e70a59a7a"
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
