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
  version "0.1.1115"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1115/veryfront-macos-arm64"
      sha256 "1613d22b90c2db51cfd8b3245c5de51eff1b6ccd0ac8b4f9c620c5067ebf7d54"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1115/veryfront-macos-x64"
      sha256 "f1a1b2bf531c6f787347cf21b239f90dfba8dd42c5c0d278c6cd78366e112407"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1115/veryfront-linux-arm64"
      sha256 "e324b2557c9b20013e8c6c3621073233057fcaeba268f254f84955e2ddf298aa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1115/veryfront-linux-x64"
      sha256 "311065a6dc5751bd92b03a7c0bc42e61d9f1306680e7f3894bd5c916478af6b2"
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
