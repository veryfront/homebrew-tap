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
  version "0.1.187"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.187/veryfront-macos-arm64"
      sha256 "b29f12e33c14d516f33d8455dbeeb50424d965bc9e3085988f0b219044c5f3e0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.187/veryfront-macos-x64"
      sha256 "f14a2f158026b6cb42c366d79787c0ef116deae36ad978b63ecc226456e309cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.187/veryfront-linux-arm64"
      sha256 "fc97085d769f51bf5b38308506f2ca0ba07dbfecce1942c34ef0f836fb84479b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.187/veryfront-linux-x64"
      sha256 "f342a4bf5ca9c0aa26cc857e655c7653253d973f48d7311feeba38f88ed2b497"
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
