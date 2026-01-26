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
  version "0.0.81"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.81/veryfront-macos-arm64"
      sha256 "7ecfe23dd808ec2edad474dfe5b40c90492acb0c2586c26763ee90eac7bfafe5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.81/veryfront-macos-x64"
      sha256 "2cb1b6f0cdf8dfbf875ad25d76a1a70e6098dda79268e66df943034106daa8b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.81/veryfront-linux-arm64"
      sha256 "e394581764d09cc159085b938a20293a04a25df46f896542731fc97f571c8464"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.81/veryfront-linux-x64"
      sha256 "0d40b152d0a433c9495b3bee12910e6f8caa5a3bde767b7b5f9131893c37df86"
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
