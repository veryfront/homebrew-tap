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
  version "0.1.759"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.759/veryfront-macos-arm64"
      sha256 "8baa8c396a023178de853e9356d33f6c3a9152fb3a4f499e6a2a6ad574d75965"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.759/veryfront-macos-x64"
      sha256 "ad0731cf37c7ac39d14b6941453b1e1c945303e61abaa00b6805ea42ba7e046f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.759/veryfront-linux-arm64"
      sha256 "5f2588b8152f29906400f32eaaee94d1cda00b27d9d6d823da3e703f41d91627"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.759/veryfront-linux-x64"
      sha256 "c4dc699c56f3b172cfee8cc4d3c233bcd925e3e5237a376c32b2e2a181e30b08"
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
