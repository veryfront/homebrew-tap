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
  version "0.1.226"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.226/veryfront-macos-arm64"
      sha256 "f9af7432fc8aee0ee9fc709f00f9eae04085f3f10865c10389fd14487089404f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.226/veryfront-macos-x64"
      sha256 "6bb135eac275b27c5f3552fc9598bf5c36ccd2744d304d0aa9717bf5b5a29d93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.226/veryfront-linux-arm64"
      sha256 "8e201442249408ef50f074422006bbf625524e88f0e8184a4b0efd9dc4c83ea4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.226/veryfront-linux-x64"
      sha256 "31c0a51bfc8b61d91c9eb75ec791a3b5a76c90cd5ca99fc2ca974b31bc1f43ac"
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
