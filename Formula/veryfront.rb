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
  version "0.1.865"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.865/veryfront-macos-arm64"
      sha256 "ed05d3f5bdadc9996bb2a7e788cc35997021ba7cfbfb7009b1c6d0862c561cea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.865/veryfront-macos-x64"
      sha256 "ba5ede6fa561b1a1b766bc1e6be9cf814e0f3c3bfdd56be40ac434f2933262df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.865/veryfront-linux-arm64"
      sha256 "583f25ec0992c8fbf5f9089d1d70d59941a85d5484b6cd9276fe4e34cdb66e28"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.865/veryfront-linux-x64"
      sha256 "8acee31e0f71eb854aaf2f5ebdff11e64a8975d7f093307c479dc2cbf18c6e39"
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
