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
  version "0.1.1193"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1193/veryfront-macos-arm64"
      sha256 "88392503bf1c4ca80dbe2ff13e0cc5faa3dc9c5b45993a6f55a65f8e5fccf0d0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1193/veryfront-macos-x64"
      sha256 "4a99284015ea74d480e92187534380b3121665e7fd4988af34581604e28f9ddb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1193/veryfront-linux-arm64"
      sha256 "24b2829677e23b49ec9e18e5c67b1ea97630d916dc7da0e6848bddf69e659fce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1193/veryfront-linux-x64"
      sha256 "52c3000c47066211b890d7c5f0fc2a1fd69eee10c5068029b8f212368d8518fc"
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
