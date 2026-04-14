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
  version "0.1.202"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.202/veryfront-macos-arm64"
      sha256 "dab23050c6dac4c9ee11818a003b6f2df20bd44fc3b04bee7964e03cfc4e0d02"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.202/veryfront-macos-x64"
      sha256 "fb754a673873ec3012b7d12f4e18729c6ed4cfb55ab2f05b39967388f6148cc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.202/veryfront-linux-arm64"
      sha256 "4a4d2bb8d9666c1b0367b416563163a6dd6471edb0900ca594e9bdd8417f1a5c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.202/veryfront-linux-x64"
      sha256 "388f671dbd19329e5f8536b57cbdcdd72fd471bf6f7199bc66398ef391acbe66"
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
