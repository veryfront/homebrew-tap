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
  version "0.1.483"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.483/veryfront-macos-arm64"
      sha256 "8cd5ec697a67cf0658dcee8114a5c6495a34625076fe0e24bd32a78b54763bf9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.483/veryfront-macos-x64"
      sha256 "1c22c8bfc92f942633dc4b5c623693a263d29431424b21e4b1dfa4eda9df1209"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.483/veryfront-linux-arm64"
      sha256 "953eca57d6cc481135f169099f39b10e0c2223b2635514e7b9c53eab14344b65"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.483/veryfront-linux-x64"
      sha256 "2bf293c2a87b194ed7a694e91a939de1ff097abea4ddad8425447cb4f88ae208"
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
