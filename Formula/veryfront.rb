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
  version "0.1.300"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.300/veryfront-macos-arm64"
      sha256 "736ce0f746e81d953fca24b9201e14ba2a07a7f72a0c9178e9c3e4e07ff8713a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.300/veryfront-macos-x64"
      sha256 "e68cf1e1b6a32f8550e37c2baf8b30d0fcd5445d35bd7eda2fc9e6b88b77fa06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.300/veryfront-linux-arm64"
      sha256 "a11c307f032749d6ba23aa92eae9f31e9e90290b7aec4ba99f4abcd9515ca54b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.300/veryfront-linux-x64"
      sha256 "32e692b02dbb46ea6053fde0757af7b82e0af37175742bcf03c9955ae74f0fa0"
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
