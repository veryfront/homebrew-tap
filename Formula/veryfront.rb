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
  version "0.1.389"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.389/veryfront-macos-arm64"
      sha256 "9f1e3a9fb3883ca90855f2f77d5533cb6e1c10b4301abc67da27f0afc51a5e83"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.389/veryfront-macos-x64"
      sha256 "d0200587d45665d605e8dd3371cd9ada36d682490990b69b95eff5141f699203"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.389/veryfront-linux-arm64"
      sha256 "da03c6eba79c3ab874d9309bb4e3e06a719329c89c84b96aa9bffd3773efb800"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.389/veryfront-linux-x64"
      sha256 "6bda6422594a9c6cdc9a0b151f409cd8b164bb81228629a338c2136965bf06f0"
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
