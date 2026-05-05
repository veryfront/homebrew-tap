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
  version "0.1.395"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.395/veryfront-macos-arm64"
      sha256 "2e9dc23c8e112559bfea93f57c89b2ba8a59c17359156b34b6f37f215f4f3fe4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.395/veryfront-macos-x64"
      sha256 "f51d3fde06f533fa70e42dabe589240ac42751fe13a154444f9fe1763d435372"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.395/veryfront-linux-arm64"
      sha256 "c5946ca5ff800e97e804b5497fac2a2277d2d17b3a64b9c648bc580615fa7555"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.395/veryfront-linux-x64"
      sha256 "fed97b8d68e92a723838f111eb3139c5b77e9aee4b03205e318b9cd3c4402c74"
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
