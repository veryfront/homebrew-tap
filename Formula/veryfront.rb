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
  version "0.1.826"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.826/veryfront-macos-arm64"
      sha256 "ca0cd19e6bc82721f9ede4c961e3b50ecc6bcff275d24a1681e721ac0db64de0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.826/veryfront-macos-x64"
      sha256 "f2c298d79b98fc9734e5949923e17e09bdc1cf7f2324917c9084b12cfe92ea71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.826/veryfront-linux-arm64"
      sha256 "28cf610d54f5741283c948776149c862b0f81338f282f1bd4f50b0c7028c5309"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.826/veryfront-linux-x64"
      sha256 "e58b234c2167e68f63605f1d008454ee3eb4f097120b0dbfa0b7b254232db1d5"
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
