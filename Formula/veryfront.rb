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
  version "0.1.987"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.987/veryfront-macos-arm64"
      sha256 "11d46976f58120579116bc6396a88049fce7f6afd8d901bd8e9b738edc55b214"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.987/veryfront-macos-x64"
      sha256 "a7ee81dc9002e0e2a61db82fdc36c3042680370010b30516751cd90a297919fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.987/veryfront-linux-arm64"
      sha256 "527b9bbfc2c2efd3d9c0b211fe74205f1ee720ab9c376dc537756449266737ee"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.987/veryfront-linux-x64"
      sha256 "2d0f8992d991159510345d1652b19079fc163c1b7c970a6a63c0adb36e555016"
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
