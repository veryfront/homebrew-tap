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
  version "0.1.531"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.531/veryfront-macos-arm64"
      sha256 "d2b8b731768f7317fee03f4e1a2ae13869a370adb73620df4733b5eeeae9fd75"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.531/veryfront-macos-x64"
      sha256 "4f055cc8aa031983ebac0611bb55c7322410579cc7ef1e95afa4cf90295c8507"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.531/veryfront-linux-arm64"
      sha256 "2463bbfe3c7b6a64103bb722bfb6de729314060f2ff3fac54fe980f6401aceb2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.531/veryfront-linux-x64"
      sha256 "35354297d6a4d718d949a3c702ec7352cb13313a869f40daab87c6ee5b97fb9f"
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
