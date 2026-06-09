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
  version "0.1.708"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.708/veryfront-macos-arm64"
      sha256 "d192d262acc8ba93ec909c1f020c0d933164651b8cf2a37a77682911b0432951"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.708/veryfront-macos-x64"
      sha256 "11d0c51b75bd18123a1ae600aed5a6e91b51a7fc19e3121064b8f060dbf6b2c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.708/veryfront-linux-arm64"
      sha256 "349007b7ea12343f651d8c410d8a4b6f9f7e5936e2da4d2cd402818bb1a37414"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.708/veryfront-linux-x64"
      sha256 "30b3dd2da47f1f447402be9c657f9f1b8ffd8e8195d54635392a67d5f74ae115"
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
