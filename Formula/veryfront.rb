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
  version "0.1.445"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.445/veryfront-macos-arm64"
      sha256 "8f944dbcb024eb4592d0b48e3f23759432ff83eef0d3ca24a13c1e259b1582e6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.445/veryfront-macos-x64"
      sha256 "add369b9da6b5a07aa0fbc2c6eecf2cc6fd88c61fb4ca4b5d124d9b9f3c57c77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.445/veryfront-linux-arm64"
      sha256 "b73aeeb0bb68e8c133d046b7ab186a4f6bcccd87e1633528b2586e8b829e31b1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.445/veryfront-linux-x64"
      sha256 "cc10bdba1ad905bf623c905ec81d4e44a41ebe08d3af4509a8f481af7da28018"
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
