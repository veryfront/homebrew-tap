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
  version "0.1.1016"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1016/veryfront-macos-arm64"
      sha256 "0f71cd349a238f19817eb23edca6bcadae8c773e634d34548b455d9ca8b39a81"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1016/veryfront-macos-x64"
      sha256 "a8c567ff850fa8a198cadc512acb48d843c4646b5da92dd14212b13966309137"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1016/veryfront-linux-arm64"
      sha256 "a29b88d595843eacf800e81af9e006d59788241f36fe018e98ae6ee763f50831"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1016/veryfront-linux-x64"
      sha256 "78b7d2e8542c33a682b1f22512c08a3a00eed7303c665d02fcce5aefa4f418f9"
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
