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
  version "0.1.839"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.839/veryfront-macos-arm64"
      sha256 "b0e8a6f3f11bba2e7bb53456be28bd7da5ca89589686da70853873b243923a17"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.839/veryfront-macos-x64"
      sha256 "c574e709dcb3164e17079a912c5f774d7f11b96191d922e7e21588a274108b95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.839/veryfront-linux-arm64"
      sha256 "16804b90d7db264850154e2278cba1901efb55fd780c5519a08a590af8374f18"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.839/veryfront-linux-x64"
      sha256 "2c73b4451de73f47e4752096b8f623c1ab471f7eb0c914b15d766017e5a06959"
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
