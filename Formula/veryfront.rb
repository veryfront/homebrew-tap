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
  version "0.1.24"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.24/veryfront-macos-arm64"
      sha256 "4bd74401c01b79028d374bc8286502b05e0d2b3677306b211b77f29da1bc3c47"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.24/veryfront-macos-x64"
      sha256 "b79f3400c0f8b3420959f62acb2280bd5953f935e978564ec94e27b0927557a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.24/veryfront-linux-arm64"
      sha256 "0b0390a671386d29f7c4d65f5373316baacd6c9ad8a560bdb7d0e2ea61944870"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.24/veryfront-linux-x64"
      sha256 "a689eb537e215a6e3365b60e81186ba450fb2246933db8a57fa29a8873204001"
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
