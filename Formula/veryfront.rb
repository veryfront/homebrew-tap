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
  version "0.1.88"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.88/veryfront-macos-arm64"
      sha256 "05f3282f0afa9f2ea7fbc0b77b8d3b68ebcc1ddb24c0380654e00fd7d122b315"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.88/veryfront-macos-x64"
      sha256 "66875baae052b87b32abcf14aee8938423406a652b1a68182f8c4c9d1b94ce2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.88/veryfront-linux-arm64"
      sha256 "5a898945e97f3e126b6fc0b1a99306d2c45bad391f7993148c2f65b9a53127b0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.88/veryfront-linux-x64"
      sha256 "05c03de4d68585c77f84b914d5968bbf08768e889c0974b387352a175374b546"
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
