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
  version "0.1.599"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.599/veryfront-macos-arm64"
      sha256 "4472f4c5bf843c7a0db6eb3b90f7f402c35918cb66f5c53e622e8381614095b8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.599/veryfront-macos-x64"
      sha256 "2f5d932477c2bc6ebce2ac053f96fdf200126bd166e2da753f968a7329776b8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.599/veryfront-linux-arm64"
      sha256 "1d61653002be00eda9bec4add91fd7852006ec266f3b28ec926e63266b5c526b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.599/veryfront-linux-x64"
      sha256 "694d580b65b3f5f0a5587578e7ebf10b9150b2bf80576fef408b4459a24ce612"
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
