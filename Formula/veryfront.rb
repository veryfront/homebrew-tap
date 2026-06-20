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
  version "0.1.873"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.873/veryfront-macos-arm64"
      sha256 "99a1d04f961ccb1e3d90b3d27b03c437e487d61f94eb203ef388477260962bfe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.873/veryfront-macos-x64"
      sha256 "7096567d23e2f26dcebf150649c6e596c5f1f12512215ffe9862e1162e85a8ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.873/veryfront-linux-arm64"
      sha256 "192d5f537d719f1d98021a4be517f5870f4e79a957e67fc54230ec85ac1e45fd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.873/veryfront-linux-x64"
      sha256 "ca842642b445dd7f227ca83aacf89a80451fe9fcb1aed7957ed2d597292b1e6c"
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
