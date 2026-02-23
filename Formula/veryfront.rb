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
  version "0.1.23"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.23/veryfront-macos-arm64"
      sha256 "d85724d898ad57e8f9a6ba59d4e4bf9b3acafe50b3e7aea656756b2cffaecb35"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.23/veryfront-macos-x64"
      sha256 "e8b929927b6b98485cef52e013d6639dff88b48ab313c130b9ce887a2101247a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.23/veryfront-linux-arm64"
      sha256 "b5ee4bf24bc116847b9f1bf5b6d6f09ed1ccfbc120c26d60646a7956e28f97f7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.23/veryfront-linux-x64"
      sha256 "a370f583c01a88935793e2ad789969888237f6463a7556db191093f4a0770942"
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
