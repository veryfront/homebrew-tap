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
  version "0.1.28"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.28/veryfront-macos-arm64"
      sha256 "9b2ca7bcea5d2015865adb77ab5fd8197c1bac90cad0c4c35ca1dac09b536001"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.28/veryfront-macos-x64"
      sha256 "c93c00bb55e22521de60c37ef414211f77d0e6f2b987d26781e74f096a69ff1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.28/veryfront-linux-arm64"
      sha256 "cfe703169203e667203e4518b6ab74de4d277cf7df24f1c9948109c2aa901b5e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.28/veryfront-linux-x64"
      sha256 "57f5deb4231db687bf855963a1f42fa1a4868d64157bd297d6c681dc5d2d6b0f"
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
