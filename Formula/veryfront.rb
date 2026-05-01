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
  version "0.1.341"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.341/veryfront-macos-arm64"
      sha256 "2fc28edafad16128d5132bb0b942152db726bce2b91b67d71ab520faf91ea26f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.341/veryfront-macos-x64"
      sha256 "0aeaf7ec3b1d60cda4dbb27494d8f9b46007499cb04ffa06a136070774198955"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.341/veryfront-linux-arm64"
      sha256 "aa5801bc95236144c9b760af7ff3693afc135e8346269079a6f4f291e329fb8c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.341/veryfront-linux-x64"
      sha256 "18327aed76272daa461422a767da2b6b4db5e20544db997e70ba13fa531a074d"
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
