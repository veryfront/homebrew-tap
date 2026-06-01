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
  version "0.1.629"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.629/veryfront-macos-arm64"
      sha256 "775f60a3212b8983e943f32481465e2d95e59222f8c3ba9ece58421dbe811689"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.629/veryfront-macos-x64"
      sha256 "e9b923568b55701f30df0082d650c6c483c057c4bd7b35a6e1633b037e66915f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.629/veryfront-linux-arm64"
      sha256 "f0fa0490e4964f5404abcd8a44fd43197bc762a10e9f0f14e17e2357c8d03a68"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.629/veryfront-linux-x64"
      sha256 "d06d8f2febd2a42064f221b4e45feb28c957efaa008f54d30f642d2c8cb5bb8c"
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
