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
  version "0.1.1268"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1268/veryfront-macos-arm64"
      sha256 "0904ecb79d46e26d375c2ea8a3bb6781397fe901fdfc1d37f6ccda4caee2e6c8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1268/veryfront-macos-x64"
      sha256 "988f2e23260f8522032c46cc0b89662e07b0fe5c574083da5eeea9dd20a12bb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1268/veryfront-linux-arm64"
      sha256 "a46dfbd9ff4047cce0caf897aeeead8cb7759369fb06a17f0db177a9265028bd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1268/veryfront-linux-x64"
      sha256 "133b2d2e30a5518e04646b6ffc77c7ad730a5d4c5721fd09d37b6a6401b1f09a"
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
