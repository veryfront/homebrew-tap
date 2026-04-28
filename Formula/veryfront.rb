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
  version "0.1.291"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.291/veryfront-macos-arm64"
      sha256 "b8e4abdf960a3c55184877abf6be0e41caeaa13e92c550952deeabbe5784ba88"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.291/veryfront-macos-x64"
      sha256 "1a00aa2c07ad2bf8ef09b16d88b01b401a5475135c1b20296b8f9eafca0e7eb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.291/veryfront-linux-arm64"
      sha256 "cf75602344ea6122a3e196a405354704d16d0dc1af07bdf1e1a90b34336f4702"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.291/veryfront-linux-x64"
      sha256 "6705011a40b3dc7d4a94e66c9cd9a8261ee29c5ed49241e4ab494656dfe8a9de"
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
