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
  version "0.1.818"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.818/veryfront-macos-arm64"
      sha256 "b929307d1bf85c4701fa13f95a5f9488a5ad78536579f963c6d2fb7b74fd5dcd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.818/veryfront-macos-x64"
      sha256 "290e42701c24c6ac5b6448d9ae289494c1530ed17baa807913fe1851192dbda3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.818/veryfront-linux-arm64"
      sha256 "3e66aa6c25c397fa0a5bd9c2a64d5f4aa35ac3d535f670fcd4b33a4679b751af"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.818/veryfront-linux-x64"
      sha256 "51a012a2ac86e8daa7b869387993a94a1196d34c3602b803ab66ee61bb9f3819"
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
