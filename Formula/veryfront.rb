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
  version "0.1.1162"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1162/veryfront-macos-arm64"
      sha256 "ff4d31da4d89f5dbfb4408262b3f1868bbf0f65a1dfffa86e7f8a68940a679a1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1162/veryfront-macos-x64"
      sha256 "1a68a7db629cd8db9b3b080db4c7cc80eca315efea0bef9405e89a3a447fb24d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1162/veryfront-linux-arm64"
      sha256 "437228c022749b0939e6ceca392286ca3e410ac5d314e7a55754ef5aa74c0bfd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1162/veryfront-linux-x64"
      sha256 "6a38190b9b315724ae0de9c63cc200e080defcbe742f67432d9dbdfcabe451ca"
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
