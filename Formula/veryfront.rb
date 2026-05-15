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
  version "0.1.529"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.529/veryfront-macos-arm64"
      sha256 "2f42281b208417183e28ecd14c8e32fb8da07478789dcd03aba24169d3a89b5c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.529/veryfront-macos-x64"
      sha256 "2d1b0fa330e61c8b56de094bb6cdf9b338401057d864f7875e985c5357b51b4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.529/veryfront-linux-arm64"
      sha256 "cf1d2524c1fe50c3e38af6a6845ec6887b81baa31b50a1cfdd3fa026072dc9b4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.529/veryfront-linux-x64"
      sha256 "a9bbc36a465c50edf77632812fe9b1ac8264eb5be16e8dc0c7b1360faa60122a"
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
