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
  version "0.1.1052"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1052/veryfront-macos-arm64"
      sha256 "fa5c407ba6a47b21e42e12fe0d4d700928a09736da18513cbf2e6a1ce3b560a8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1052/veryfront-macos-x64"
      sha256 "6383d6860c8b70b0638ed5f612012f1cce984ce8b84ef81777e8212eb5db8b0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1052/veryfront-linux-arm64"
      sha256 "1735cd21ead1f2748e66231517fa8cd09150d349917c4372a6d02db720b65bca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1052/veryfront-linux-x64"
      sha256 "5f68641033fc95da69e1ce80079aa8aff4db5bb80fd7839ecddbdb55d0017598"
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
