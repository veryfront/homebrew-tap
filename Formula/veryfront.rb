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
  version "0.1.198"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.198/veryfront-macos-arm64"
      sha256 "4541f1a7dbbceaed69bb48ff833a23412d04e4541495539f00506b0f57048904"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.198/veryfront-macos-x64"
      sha256 "1ae333f8eaeee55a57a8d035d26d070b9277ef616f2a8ca241458e7d2d771ba8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.198/veryfront-linux-arm64"
      sha256 "9641e445af107ea5582b46fe372c33c8cd50a2cf0a2b47683df2d44b82870676"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.198/veryfront-linux-x64"
      sha256 "d6086742910930ace1a0c500b9c876538d7b5413f3ca7e418618345fb0a4804f"
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
