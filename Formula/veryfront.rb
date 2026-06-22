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
  version "0.1.895"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.895/veryfront-macos-arm64"
      sha256 "788c5c9b8fa38c0304d79e65567dcf13cb5ce06505d4353ac70c5b3c76d31ec9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.895/veryfront-macos-x64"
      sha256 "c59b9358e5a40a1329f9fea442d4f6835d22b803f86cb81a18837a4bd5d235c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.895/veryfront-linux-arm64"
      sha256 "ff88c2bf16458dbeeaa21846cc5a1f3b6ede8f5b819b013a460ef8a72ea0a176"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.895/veryfront-linux-x64"
      sha256 "0e5b54a02585f87e305fe8b5ee19eac62cd6b2213bc735372a71e9f7676c402b"
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
