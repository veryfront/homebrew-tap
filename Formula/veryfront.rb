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
  version "0.1.312"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.312/veryfront-macos-arm64"
      sha256 "5c0c50d0720038e9a50e6db1cfcf040dff75555a9e2b75ef51fecb45c6c3b23f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.312/veryfront-macos-x64"
      sha256 "065c3bd93fee03036862c8d3ddc21c9030170247d3f20bb14915f47e47ea6d63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.312/veryfront-linux-arm64"
      sha256 "8f3eceafb94c12a41fdf4228830027a37b650a09ecba2d327e91da77892fff18"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.312/veryfront-linux-x64"
      sha256 "8ca616ccdced828ee3b2a0e9eb6ae616730f0a5c863244e44d35d6735fa65f94"
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
