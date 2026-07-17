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
  version "0.1.1080"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1080/veryfront-macos-arm64"
      sha256 "e3202d8c15ba9e932e17aa99e07f320de9fee0c04af6b62d5f553fae3e370f1b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1080/veryfront-macos-x64"
      sha256 "7b88f2a3326340d7c4ee4bc760c117268bb5024eed51d816b8c4ce459e955a31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1080/veryfront-linux-arm64"
      sha256 "d6ad78bb9417dbac923ea4bde24f87543d77a87cdfe789572abde4c885fcfaf4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1080/veryfront-linux-x64"
      sha256 "2ffea918d5b2626fd30d2f492e1bbf8df83ce91386727ad7aebc6479e5a39e65"
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
