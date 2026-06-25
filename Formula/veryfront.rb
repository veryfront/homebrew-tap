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
  version "0.1.925"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.925/veryfront-macos-arm64"
      sha256 "40db4e856902c0c62b79305049b3066d5ab6bc4283b492068b13b7dfc4cd0c94"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.925/veryfront-macos-x64"
      sha256 "4eabddf6e993942fc4064dfe2791fbf026daa1e1c0e28c8ce27613ce9a29c8a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.925/veryfront-linux-arm64"
      sha256 "67eaf528f888a2d3d4222fe5ce86bd4362213266e7a94e76438e35ce1051c530"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.925/veryfront-linux-x64"
      sha256 "94dd3827348c8f6fb6e368f76fe2dbe942a95b59ae70054a607e07ff605bae97"
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
