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
  version "0.1.102"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.102/veryfront-macos-arm64"
      sha256 "a821b3327af6f8e672f1fee8f6d3857355e1346bec5c26fc65ad3a6868e1aad1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.102/veryfront-macos-x64"
      sha256 "4e33de1a917fea71fa57954d5a4081d7e9dfac5aa60a8f0692b8fcecf6f36ad3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.102/veryfront-linux-arm64"
      sha256 "1ee6d4b67f89ff31fdbebed5cc666f2810e6dcb0c3ace07948e4cfe01d99e286"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.102/veryfront-linux-x64"
      sha256 "1d09a336305df7dc11e9b0c8e6cce94f1975e2b671e9c618d811f4a75b5df8ec"
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
