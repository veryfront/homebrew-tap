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
  version "0.1.216"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.216/veryfront-macos-arm64"
      sha256 "186e43b3b409a88edb96681540e663b2b7a029008aa0fa1cc2d4b6c5aad2a0ec"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.216/veryfront-macos-x64"
      sha256 "3cdbb0e2d0131c26a372d104c766c2b15f5d5cc67845369b96679b0e3de81999"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.216/veryfront-linux-arm64"
      sha256 "f9003e23c5ec7a28e54d02f5bc3244ee28708f59cd31f36f9a3f7a2a565a1623"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.216/veryfront-linux-x64"
      sha256 "d6dc0d963458c37e845be54bcd6903e50c84dd3fab58bbd503a704e59bc2cc41"
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
