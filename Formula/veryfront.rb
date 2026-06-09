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
  version "0.1.744"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.744/veryfront-macos-arm64"
      sha256 "3b8a1f3540581345af76c4c32d34ac675a8b19c2d4e89b85a2d6d286ae808640"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.744/veryfront-macos-x64"
      sha256 "35bf4474d5e457e1f4cda6bbd9aa93f414ada92bf6b5f815728e0cf4a6ed3b65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.744/veryfront-linux-arm64"
      sha256 "e28dc6727c1ea0badccafa77c64e0d35c11703f1f6402d61b1697f6c0a411882"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.744/veryfront-linux-x64"
      sha256 "4e18cb35d5988c40a6b9d4b9024de6ef48d1153aedf9ca5467b17db732e778b7"
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
