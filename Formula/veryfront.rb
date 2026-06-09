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
  version "0.1.692"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.692/veryfront-macos-arm64"
      sha256 "f0a8dcb991646fc8769098311b076b2edbd5400d51439e61da81a09af3f05528"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.692/veryfront-macos-x64"
      sha256 "28dad9b6d274634aecbc3e15359baa8c59fb8fd7531b8ca67a55b98659f07c18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.692/veryfront-linux-arm64"
      sha256 "ffe3511b8e99c40af252b807a9808f34bc595a0957fdb00191164c98930c2c64"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.692/veryfront-linux-x64"
      sha256 "5663a97dc25e2c0ca2680a46576a22144ab565ef220fb812f189f9ecca58b221"
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
