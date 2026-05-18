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
  version "0.1.557"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.557/veryfront-macos-arm64"
      sha256 "0fd512fc7c1348d116a42ccc055a5d86c918af8f8e9a22768257aed23535711b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.557/veryfront-macos-x64"
      sha256 "700e526842be08fe7a42f31f02f2c7703e6616dfbd96b0a0a7ff1bb0bc299279"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.557/veryfront-linux-arm64"
      sha256 "884764c87483d603b4df4be4e15ccb26640038b347eef10bc9ab07b028515ab5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.557/veryfront-linux-x64"
      sha256 "f8c468a0280e2d18ed9a25713e5d0d350042da917a56e546218c26ad1fb65488"
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
