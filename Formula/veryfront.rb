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
  version "0.1.790"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.790/veryfront-macos-arm64"
      sha256 "2f0ba7955b6f758a52931e184045ff63c256dba7c43e1152ae3303956e7246c1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.790/veryfront-macos-x64"
      sha256 "e3d50ebde574f4f1c0005565f71d5fd72fb8b9eb2ee8ae442c58148d8d0cf104"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.790/veryfront-linux-arm64"
      sha256 "e200eaa7a41d227929631e6acc3aaa9f523ee0fc15dcefefd1868e4591d8117f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.790/veryfront-linux-x64"
      sha256 "bfc671945ef380aa9801eab829be5350d5a7358e38e8190adfd29749143ac119"
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
