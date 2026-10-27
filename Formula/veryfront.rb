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
  version "0.1.1286"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1286/veryfront-macos-arm64"
      sha256 "abd97b7ad8c468f007ba78b62bb1bf09dd2f45acbac267421415a40bdfe944a6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1286/veryfront-macos-x64"
      sha256 "0908d4ff6f5da65ff0f2f41d2837b7b8b9bd4264b847244b93da929a7bb04844"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1286/veryfront-linux-arm64"
      sha256 "cffaf3c3345d21387b6c86f67a264b02c3619962229314ee8375cb1b1272de0d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1286/veryfront-linux-x64"
      sha256 "e65434aaa9e3251c986d0cfe4c7be13a11d71a4f0ee5a924a6150c941e0a8eef"
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
