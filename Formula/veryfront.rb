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
  version "0.1.144"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.144/veryfront-macos-arm64"
      sha256 "1bb8bdb669ccb4fa17c1e2945473eeb8dfb542d3e25fc0d03646f087baab609e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.144/veryfront-macos-x64"
      sha256 "3e15d23052864e9b8b7b83550f5edb2fc7537138681a3c4711bf66b0577c0ab1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.144/veryfront-linux-arm64"
      sha256 "473b31f4f15358bbeb02f4a9f9c4dda6e48b549dbea2a92e763593b0e8a7d1af"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.144/veryfront-linux-x64"
      sha256 "a725a799dec432042b46501ba503f3c3096bd553b81d6e885d9babfcb18d9f79"
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
