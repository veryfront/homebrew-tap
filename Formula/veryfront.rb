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
  version "0.1.484"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.484/veryfront-macos-arm64"
      sha256 "52dcf0efe82d0de78938283398ac386874b08cb6bf32b57750ee9e1d07433863"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.484/veryfront-macos-x64"
      sha256 "285a1d93da45c3a41856bd0d62e3fec579ce0f8a8ce1ed7881d5dbbf4cdc48f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.484/veryfront-linux-arm64"
      sha256 "c2ba013a57ae34893f299e866289011f858c91594f09dfaf1d6df9c1db33daae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.484/veryfront-linux-x64"
      sha256 "95315c184c2826a52b39719e7935f839bf462b7a5d23ccf4476f4a8cd0458ed2"
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
