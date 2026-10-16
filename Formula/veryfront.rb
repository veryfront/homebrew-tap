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
  version "0.1.1277"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1277/veryfront-macos-arm64"
      sha256 "c509bb64bc376db6abcb57dc49299b3b0ac275c94bf1c11eadcb2832f1e4b9aa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1277/veryfront-macos-x64"
      sha256 "c04815714f206790b3f1bf73a055f9343caa4bb99c7ddd9c5fb79987147575c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1277/veryfront-linux-arm64"
      sha256 "6686f9044ba927ff7e6abb07e17defa9b015bebef1d0e8150c77a287aeb456eb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1277/veryfront-linux-x64"
      sha256 "bbf758a48b43ea0c5c2dd9309fe4b521661cb0c2572b0e00a1cb9d02eb0ec3a7"
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
