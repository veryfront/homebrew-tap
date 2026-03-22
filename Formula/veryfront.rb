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
  version "0.1.91"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.91/veryfront-macos-arm64"
      sha256 "1f8cbe41f88c7c0c124bc0aba523cdcb5908ac4553c740b73f74a57a449a512a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.91/veryfront-macos-x64"
      sha256 "9f90c91682001d5d0b2d5a5b49665563a92e55090174704de93d92a930d5647e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.91/veryfront-linux-arm64"
      sha256 "74fb21c4b5f3c8a1dc7ea57599b9a8d7cfa871d91d33088188cc15db8b5aa480"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.91/veryfront-linux-x64"
      sha256 "ad694c9634c2070eb986f2654fbfb03b10844406ac2a276c776acf906dc36e49"
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
