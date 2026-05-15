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
  version "0.1.525"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.525/veryfront-macos-arm64"
      sha256 "7742f0f673837eed2a4d8f4f1fcceb482db1524c6010638716d21dd9177fbbaa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.525/veryfront-macos-x64"
      sha256 "13ad685e29c0d684f06d11fc95b2057a4e21b73db722b0d974a870febc592fcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.525/veryfront-linux-arm64"
      sha256 "3849bed883dc51f1feb96008e8c78d13edabe63f60f4c0d7f0acd15eb485346b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.525/veryfront-linux-x64"
      sha256 "a978ce9648a9a28324dbb06d31a727442cce525210479412f1ae0672adf56753"
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
