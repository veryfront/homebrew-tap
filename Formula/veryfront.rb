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
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.16/veryfront-macos-arm64"
      sha256 "30c2209fa567900929a56c61e73df52b9fe774c90bbe00f94d0c0d9960ab6f42"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.16/veryfront-macos-x64"
      sha256 "0a3065f59f66484068d9d3186b1c687698e87553ce9c5e53653f667ae1ad1f84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.16/veryfront-linux-arm64"
      sha256 "cdf70c3272a7dbab5747d7d104797602b15581f5a48bed4046c9e4ceca8ebd08"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.16/veryfront-linux-x64"
      sha256 "fa37c632970b5e3aa417c03a9b9292fe00e462d5351afa4f55a3b2cc728cc75f"
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
