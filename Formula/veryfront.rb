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
  version "0.1.766"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.766/veryfront-macos-arm64"
      sha256 "0bbaca6b2d46a535b43e269e42653e54d591c90e7a489008bc621ba9c321a9cd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.766/veryfront-macos-x64"
      sha256 "dcf0b23c67b35749a22caff27b0f6b7fdc9370237106022977f803757cc95c28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.766/veryfront-linux-arm64"
      sha256 "7d1895d7a44ededf9c06dd8efc6c9ab5eebfef08de2882bdd109edb69137c933"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.766/veryfront-linux-x64"
      sha256 "75a93875cd373a730095ea36a67d2d013a3f9ff092feda36a28d3edf6cf35577"
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
