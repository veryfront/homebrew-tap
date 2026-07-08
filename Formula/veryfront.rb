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
  version "0.1.1027"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1027/veryfront-macos-arm64"
      sha256 "44a82b4dc5875cf7559c1d8e6b0712364cc3ff2c810c86efb710b871907b1af3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1027/veryfront-macos-x64"
      sha256 "63107d617a59bf4df747bfb33d1681cc69961f079bd888efcd45571e78027fe6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1027/veryfront-linux-arm64"
      sha256 "2ce421f6f06b9b52f5c0157524bd19a8d5239fe73dc737a01fc3fe5d35bca441"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1027/veryfront-linux-x64"
      sha256 "5ccd71c2acf2c9f9a8736f12de9270d130ff7f5a4aa734b9f89fe106b697a6d4"
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
