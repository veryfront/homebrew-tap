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
  version "0.1.632"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.632/veryfront-macos-arm64"
      sha256 "180d150dc0c9d54c098cb3a060b192bdd59149913a5f4b3b5cda9d02bb849373"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.632/veryfront-macos-x64"
      sha256 "e6f8824e5363f7d1afa55d83573c3168a35f61907367d935ec3327c4f59592eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.632/veryfront-linux-arm64"
      sha256 "76b9b11b15162ab806fc601a3734f5744268da5f6eb4e6574e26e1ddb580a323"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.632/veryfront-linux-x64"
      sha256 "f51bc95906a438eed5935d722920493942acb1470e62a8b9721461bfef2bc949"
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
