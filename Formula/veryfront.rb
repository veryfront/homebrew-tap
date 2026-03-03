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
  version "0.1.45"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.45/veryfront-macos-arm64"
      sha256 "26eab15c6473893e937936a1d808516749a68345ba3a7aee36f33e857448f132"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.45/veryfront-macos-x64"
      sha256 "df5d302d6d0486631e39e3ce3de853eaa5793d07d5507a1ee52752f9b54e3c72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.45/veryfront-linux-arm64"
      sha256 "6f41dbdaeb3b2d938510f2af9f6d9ca7bfa9025361047e97a812595b143de0b1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.45/veryfront-linux-x64"
      sha256 "40068635a34ee7db61c813b255eb9c608bc2e7082b62ae25572a50955dac163d"
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
