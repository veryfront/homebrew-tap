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
  version "0.1.84"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.84/veryfront-macos-arm64"
      sha256 "cd9de303bcec4dc70c7a09410b778bc427288b699fe4a8ac0a8cac1cd25ed162"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.84/veryfront-macos-x64"
      sha256 "bdb275ab029d5f6adeedac33ffe538dc7dfec3a98627128635c2dc1b3e43a35a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.84/veryfront-linux-arm64"
      sha256 "b354b995c16e675303314f0a6a57ad3d110fbf111764878633cf65d75cf42e6f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.84/veryfront-linux-x64"
      sha256 "f41d26fa2b0ccbfd9a68e3a4a3c1cfa0c6a24e48b6e6ce695bf15f1596f6f996"
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
