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
  version "0.1.612"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.612/veryfront-macos-arm64"
      sha256 "41a38310d20e6006bc85214ea4c2cb73dc0f291d97084f06f69f82a0be00ad46"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.612/veryfront-macos-x64"
      sha256 "3e9557b5d7d631e636bf6056b3b9c8637b87277f506703b4f981aa0e7a7c357b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.612/veryfront-linux-arm64"
      sha256 "d2cb5d1cbd6dfcd5090c71a5b592d64eedb64b2c51dc2f6e8e57340b155d265b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.612/veryfront-linux-x64"
      sha256 "72c937acdfc5e52f12dd2960f8fd5412362aab980ec36dd2d05de03629ae7d21"
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
