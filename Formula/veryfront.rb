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
  version "0.1.233"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.233/veryfront-macos-arm64"
      sha256 "4f5d5b2c3262ecee0c52495527140d41a71444e3a12d848433d4ceecc97d1aa2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.233/veryfront-macos-x64"
      sha256 "64c37fff4ed31108fd3952bfd1507ea0094d59dce4e433fd666419ebf87147cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.233/veryfront-linux-arm64"
      sha256 "0415d5370c765feb69447b62da650e19f51fd386928da93cf1908141dba16486"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.233/veryfront-linux-x64"
      sha256 "44d562479a37389872988990b3de20131a6a469fa832bf61b9d0ca39a07f5227"
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
