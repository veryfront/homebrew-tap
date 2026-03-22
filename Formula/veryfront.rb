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
  version "0.1.85"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.85/veryfront-macos-arm64"
      sha256 "e0314622dae5dccff54898eea373b133096bd8c1623b5c81aed72ce77911bb77"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.85/veryfront-macos-x64"
      sha256 "9edf30d3dbcf2e7d8983884143c59deb46dbb5a28f423014fa9e3d88ce650bc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.85/veryfront-linux-arm64"
      sha256 "8926a732714bb2d28a78a125a7f290a14ad504e4f0b5e09043cae06e557294ae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.85/veryfront-linux-x64"
      sha256 "41188a4fd4bab7480494c31f290bf4be1a830b5f82bedb76dc6e9695f3b3079b"
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
