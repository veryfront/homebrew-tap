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
  version "0.1.1236"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1236/veryfront-macos-arm64"
      sha256 "8523ce82f2954f5119a91e61567438c3a66c5f9a1012c3e4d221b6b287d8fc26"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1236/veryfront-macos-x64"
      sha256 "fdb6839520453f91412c6c41a52cf8766895e0643ac55fcec2c904804f6fb78e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1236/veryfront-linux-arm64"
      sha256 "d617f44ead70810f2052a75745e185ccd13ec8a4d6b31bcd61b611d54bac0fc6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1236/veryfront-linux-x64"
      sha256 "3526d4cbd9c3e21377abe08ac295e1f4b637baa832910141821b53044eddeb95"
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
