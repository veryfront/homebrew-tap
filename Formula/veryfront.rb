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
  version "0.1.491"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.491/veryfront-macos-arm64"
      sha256 "5c4523e4882eb72575c67a5b9c61e655d3fbe90b4e2d07e294995432e92b8086"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.491/veryfront-macos-x64"
      sha256 "67fea491c3ca766b298b667d86be395281d9e499798293a41963b64e971eb242"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.491/veryfront-linux-arm64"
      sha256 "f043250645650e8b769988cf43a5bfd40bbdc4f6c358143e0caa02bd28960dc7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.491/veryfront-linux-x64"
      sha256 "2d9acd7f77cb2a1b63bac28567b04c2ce08fb3d0612f052954016a7c3c2163d1"
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
