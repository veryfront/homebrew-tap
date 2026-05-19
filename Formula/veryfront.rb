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
  version "0.1.558"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.558/veryfront-macos-arm64"
      sha256 "587a2f44306e996dc14b806e832c8a5c42bd1fda6249f780ef55e90026231209"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.558/veryfront-macos-x64"
      sha256 "d6a7dee40b382c9d769ec650f0f905896583c0ea29cfe8fcd3da4ef876b25d59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.558/veryfront-linux-arm64"
      sha256 "a85d0ca6a3710c88b055f6a59b361906b6c13bacb88fa9176cedb1812db4f01c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.558/veryfront-linux-x64"
      sha256 "0dfc9a6755bc1724014cdc5234d71d42a6d77225a536face893110815641ca9e"
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
