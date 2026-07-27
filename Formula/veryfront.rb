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
  version "0.1.1161"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1161/veryfront-macos-arm64"
      sha256 "8d54e07134af4e6c71e44e8dddc59df41278affc962512b0a56a7828bb745cc6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1161/veryfront-macos-x64"
      sha256 "5ed6d4035ed862ea5c79e60d08142c031f54b568e65bcf8a9443754467757112"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1161/veryfront-linux-arm64"
      sha256 "a6b8553456a8574d57d7f70cc8d4ea21d01cfbb54a04ede19ee4609bcb2e448e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1161/veryfront-linux-x64"
      sha256 "64b5c13a48fced2499507d56b824a15a80e6fcd162cd18520bc28c6fcd978bea"
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
