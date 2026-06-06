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
  version "0.1.681"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.681/veryfront-macos-arm64"
      sha256 "0bbb56c9e14c2e607718946f1eed67c4fd4753a33a1b259525e6ab07adbe54c0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.681/veryfront-macos-x64"
      sha256 "848f7c7a97410eb176b566ce6d4102f6469c7b8cd62cd692fb8d627fc0dc6892"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.681/veryfront-linux-arm64"
      sha256 "db930c35a4c9b361ff58269285acf8bf508fa9aa8750ccf338b4c6616787d375"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.681/veryfront-linux-x64"
      sha256 "0d625a5dd4e72e6864dc075bdb5eab2828f3bb53889e839a5ab304e8a7354016"
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
