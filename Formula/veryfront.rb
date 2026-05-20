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
  version "0.1.563"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.563/veryfront-macos-arm64"
      sha256 "f799f3508bdc11c0736d34b03b8d50629955803faf589a767c4509d72af0cc9f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.563/veryfront-macos-x64"
      sha256 "af891e35cb1dba5225c66465670bee76dc71c90fe6de0ebe7963fe604f9fc0a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.563/veryfront-linux-arm64"
      sha256 "be652247d5e91dfa0c4af07b0fb53cc8a40f0a0160bd2c0cabf4364ac6cbbc9f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.563/veryfront-linux-x64"
      sha256 "429b1362310b79d6a5d9b33396028916778f9705b502e18093dbe0d8fc205e27"
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
