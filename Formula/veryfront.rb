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
  version "0.1.957"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.957/veryfront-macos-arm64"
      sha256 "8297f7933586a8ead3497ffc869ca1e78e3d7209c20237db2f09b5cdc21725be"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.957/veryfront-macos-x64"
      sha256 "e3a0cf670e27e2ff58803f093dc368f3f95344785bca9e6ed5227841ad320286"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.957/veryfront-linux-arm64"
      sha256 "0c9c2886afe0e25fb7de2e27d944132c2594f7e1b2b7b265e3e4d1204d4427e7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.957/veryfront-linux-x64"
      sha256 "979db079c953bc808c6b760de530107ba5cb2111253c6c019382a6339dae3f34"
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
