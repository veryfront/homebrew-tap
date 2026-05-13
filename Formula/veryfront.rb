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
  version "0.1.510"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.510/veryfront-macos-arm64"
      sha256 "57589c2ae9c71625a3eb5accda8d02c59c3a5647d25f0d44aef7886211921401"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.510/veryfront-macos-x64"
      sha256 "e6a573dc4ad2f3a6fd71e3b4ad76fb9148204608b5c065588921bc24af59feb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.510/veryfront-linux-arm64"
      sha256 "140d030e11a2de6e5fc7b71a95bb95830db202528530ba136c4b84938163a84f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.510/veryfront-linux-x64"
      sha256 "32a93c694845023ad2460f0c9280ab39129532c7404205e6b5ea344680c32760"
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
