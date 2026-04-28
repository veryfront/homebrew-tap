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
  version "0.1.292"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.292/veryfront-macos-arm64"
      sha256 "805535cc79683d321b306ca4c1413ed5bca74ed71db10f16d8f1bb777ed71a77"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.292/veryfront-macos-x64"
      sha256 "cb0600f7b2eb676d0a81e5a2840750cdbb7985b4f94ba219f1e586fb8082f664"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.292/veryfront-linux-arm64"
      sha256 "c41262f7fbea9f1f5de0d06befbac40ad63c380a886a5a4e0721d609f5acf723"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.292/veryfront-linux-x64"
      sha256 "49b878d6f15810124f4140e8a790bb6050ec241d4b8d4526c81c1846e04af5ea"
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
