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
  version "0.1.1243"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1243/veryfront-macos-arm64"
      sha256 "8429b0c57e8a2bd18a2285e3099c409f2e61ec8f1fca8db7e68e0eecd699f7bc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1243/veryfront-macos-x64"
      sha256 "dd825f1dc7615c145e7b09ca13b4aa49a543190cd807c6a4473b80aeac303584"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1243/veryfront-linux-arm64"
      sha256 "6a9d400e5d6943c1e2b9ca86a8877c8dca874ac6195b14cf8cd87cab512abb0f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1243/veryfront-linux-x64"
      sha256 "09995bd85322d66c58c4529338e788c8641d15e753a88473ce6a4ebf4eefe7bf"
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
