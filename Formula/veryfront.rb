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
  version "0.1.1189"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1189/veryfront-macos-arm64"
      sha256 "8f3b2c947c6309aae2495c7071351f367f86e5673d5be1de4592605e5503774d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1189/veryfront-macos-x64"
      sha256 "3f6659c76c1478549830bbeb65b59b5b9f0d1ce2e87b3e780c74f8499071a57e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1189/veryfront-linux-arm64"
      sha256 "c6d696c07c296a02d097687f461f6fc91e32cb6cff17e8faa2d90e4ef5835583"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1189/veryfront-linux-x64"
      sha256 "acfb6af971c9d749285cb74e35f9cef057d98b000f03c578ff62de3dfd496737"
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
