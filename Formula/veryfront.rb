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
  version "0.1.400"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.400/veryfront-macos-arm64"
      sha256 "52ec7f475775769a46e5f0463fd366cdbbbc62cbd111d944c650eec1c5cdd5df"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.400/veryfront-macos-x64"
      sha256 "cbaac131484c3a0236e8071a08a40bfe5b6494add077502e4bd57dbaa99b532f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.400/veryfront-linux-arm64"
      sha256 "b3394cdcfd781791ed38e812afb1f1428b5acbf9144f4fb0ff5dbb0a5a7949df"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.400/veryfront-linux-x64"
      sha256 "29f8e8cd46537d2657483774dd5a7be38be7ddac6086c9015cce7d20b9b23836"
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
