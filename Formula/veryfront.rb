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
  version "0.1.258"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.258/veryfront-macos-arm64"
      sha256 "c011c06e4f1e2802f3050d8a14a5ae3bdb4f2001cd4d2e992c80dae2d2562c5b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.258/veryfront-macos-x64"
      sha256 "38b2506a09457452ac09215c5abdfab6195932207a4d7e41eadfe7b3a67f12ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.258/veryfront-linux-arm64"
      sha256 "eb20a1a6144e47b6e0b53a8414fa6860182bb1cf4698b57402a62716bcf71804"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.258/veryfront-linux-x64"
      sha256 "94012eb7f30dd971765b95d9aeee9099595bfa54e5f80df40bf11b3d948ac51a"
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
