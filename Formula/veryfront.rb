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
  version "0.1.736"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.736/veryfront-macos-arm64"
      sha256 "c6ea9b3dd56abe93e8439ffe29c80aa17e2eb6e0679cbd95963a2f9ea3b17c65"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.736/veryfront-macos-x64"
      sha256 "7379ed3c249c07ec673d641f9729d21e97f2cf1922504372d3fee2d3fa295bd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.736/veryfront-linux-arm64"
      sha256 "d74303ac6f477974d323887ef0efde0dec5b67d431f0b158aabbc895f12e99bd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.736/veryfront-linux-x64"
      sha256 "56a49f300fe9788840071b4729db21315d3fec86ac9ef0a144d77bb5e125ca70"
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
