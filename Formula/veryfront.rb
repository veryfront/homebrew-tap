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
  version "0.1.1054"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1054/veryfront-macos-arm64"
      sha256 "3b5c0e12a043f417584351f9f2e5ba2b5a78928c657062aca337bc86604b17b6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1054/veryfront-macos-x64"
      sha256 "580bd321b532efd720c817dbcedbf830504ff762c61bc3622d9e929968b56376"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1054/veryfront-linux-arm64"
      sha256 "9d820e68c26b3cd9987751ebc08afda4224e169e1dc1a3c9f06bf910e951dda3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1054/veryfront-linux-x64"
      sha256 "744611b52d06b6e6d33bc6db26dd19074e1e17d9172a73580a30685d17ac366c"
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
