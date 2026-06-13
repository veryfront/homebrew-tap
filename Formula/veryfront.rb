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
  version "0.1.777"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.777/veryfront-macos-arm64"
      sha256 "48dd602039800d93a803fadd8598c9035f3a242c0e03bf990a01cd56ecbb5de7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.777/veryfront-macos-x64"
      sha256 "1e37d2e41a96d9f152d5e62696c45820b594738b7c783d284f1d725c18a07046"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.777/veryfront-linux-arm64"
      sha256 "0bdcc87c66cbd20ebae0053ab0cae3b8306146cc0611ed63a911d55e2fce5cb6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.777/veryfront-linux-x64"
      sha256 "c6f4f62d0181803efa8d7e88f2adae9cdc39a439dddcbad279df76014e7acfa9"
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
