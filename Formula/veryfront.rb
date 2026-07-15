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
  version "0.1.1069"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1069/veryfront-macos-arm64"
      sha256 "105aae9e1e02e081f4d627c63c70cf5bbbc9d875542223bb576d43503f12b07f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1069/veryfront-macos-x64"
      sha256 "23afa3d8aa125f0489c70ec6593c4024b88694cc8ea2170d0e910b1a44265f81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1069/veryfront-linux-arm64"
      sha256 "3f809c4b491473d2a5ad372696c0cfaa46d635b15be9c8d064982ec04989a737"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1069/veryfront-linux-x64"
      sha256 "0997b4b12aeca3169a34ffb9e29828de11175fdac864845f877876ea40ce7eed"
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
