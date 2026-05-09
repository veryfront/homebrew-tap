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
  version "0.1.437"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.437/veryfront-macos-arm64"
      sha256 "7afc7099f7c2dd6fb2b0835704471ce28441962e5212a06b6a77c329babaac88"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.437/veryfront-macos-x64"
      sha256 "17a41a922006f6ec9943ea6dfeaf489236f612170501f3b009dd84027e1dce77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.437/veryfront-linux-arm64"
      sha256 "1a59d58ee24f2d5c31076dd03d9fe94ae39a965da1c77eae1dfa0d8f523770fc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.437/veryfront-linux-x64"
      sha256 "940c5788f9bb549f3c6a2ec427bee0d10ec02fa048353808692e48dc2bf3be54"
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
