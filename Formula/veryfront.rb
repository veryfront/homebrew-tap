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
  version "0.1.1160"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1160/veryfront-macos-arm64"
      sha256 "4daddffb2d5168b45641e444c6a213d9f00acf4f0a8cab147d46026281ee5c1a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1160/veryfront-macos-x64"
      sha256 "79c62d8561a0debcaa86e7d7f9b3e01c08285a60cd4cb41c172e5af78173b8e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1160/veryfront-linux-arm64"
      sha256 "04558dd3fbae672cd7d37239e570817f0c4280067b5234510a383a2ace80dded"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1160/veryfront-linux-x64"
      sha256 "722ef62d09dc2da82cdba865fd3791718b5b25fe5e124fadf559fc37104b813d"
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
