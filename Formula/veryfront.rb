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
  version "0.1.753"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.753/veryfront-macos-arm64"
      sha256 "852375a11fe602cbce6856abc9fc1c01aa0121804ccd2cf6b90ebb25fba606c0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.753/veryfront-macos-x64"
      sha256 "b1dc2c1b31b0cea116aa34bee4bc7ed9306c6152e54cf8f1537cc92bb0f0a283"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.753/veryfront-linux-arm64"
      sha256 "0b5b5b657db747867ab05eed3f19df11844adab8da85ec87ab74448d8e3496a0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.753/veryfront-linux-x64"
      sha256 "0d26909d5627751ae0f6d3024c422f4cd7da3a0e146b96d73045e254653b349e"
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
