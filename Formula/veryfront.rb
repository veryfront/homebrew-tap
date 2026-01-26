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
  version "0.0.79"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.79/veryfront-macos-arm64"
      sha256 "8527259c1ea0d1735a33687a5c7f58f555881f8df91241eef86165411a25200c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.79/veryfront-macos-x64"
      sha256 "e75df284349cab65e8f6dfb95f179759dc35659bcd207cf770e57ee5e1877641"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.79/veryfront-linux-arm64"
      sha256 "c8cac88ab653f2fd0811f66f0b4713c7f125b8016bca52434f50aa6d5621b117"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.79/veryfront-linux-x64"
      sha256 "15e5b795bd3f2821137036f73d236915971f7003b484f311c700c1fa6d214329"
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
