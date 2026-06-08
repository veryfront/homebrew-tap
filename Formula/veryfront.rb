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
  version "0.1.684"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.684/veryfront-macos-arm64"
      sha256 "00fa2bd80e1881a1b114f03b39eacfcbac1a8b78eec723467bfdd498215b82d8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.684/veryfront-macos-x64"
      sha256 "d099b21418cbb8d163b0a56b0b1d40bfebe40f3a60c6c579437b190a19ac91df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.684/veryfront-linux-arm64"
      sha256 "d6058e46d8af06a514cc2367f9f347e54ed4a4f6ed69e1dc16247da9c17b162f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.684/veryfront-linux-x64"
      sha256 "e8309e21e177d11809e3f9fe138fb2165d7e3bd26ddbb8fd330d2fd21ab4f3da"
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
