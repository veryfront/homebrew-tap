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
  version "0.1.500"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.500/veryfront-macos-arm64"
      sha256 "2064f16cdb6674f27a04c31154866a0d43582804df9b393d4ffd2fd44ca5d787"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.500/veryfront-macos-x64"
      sha256 "72e163b39ae6aa4272dceb5cf0ae7528665e89bfdbabac6cb42fb5fb3f034ff0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.500/veryfront-linux-arm64"
      sha256 "76cadaab99650c6b8a044c481b6b9fcdf65c8c418cce05efbe5cf15282062bf2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.500/veryfront-linux-x64"
      sha256 "cb7f0940e27cfe6e85e81bb4b5708d83c2d8f105032c0a06d98c85e4e2401852"
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
