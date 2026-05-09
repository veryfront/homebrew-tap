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
  version "0.1.456"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.456/veryfront-macos-arm64"
      sha256 "a2b238374c4a3b80ea6dbeab1b9b8669f95bd9759bc8f6cbeb08bb480ffe48ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.456/veryfront-macos-x64"
      sha256 "6b60ded2d97dbd3bdc36c5cc84d6b6e283f20d6108ef6268beda033103de6f06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.456/veryfront-linux-arm64"
      sha256 "a440ff81e8e1465fd8bc0e67dbc377502ffbc7f63f88eaf78ea258efb81d974a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.456/veryfront-linux-x64"
      sha256 "bf769490a6f96e3fb51f189b2144226b8ffd198cc9f33dc9ecc24e229afa3864"
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
