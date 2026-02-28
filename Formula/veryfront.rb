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
  version "0.1.41"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.41/veryfront-macos-arm64"
      sha256 "eb9e6b2c8390a0c29814a9d9f566a26116964a089deef6e1a752d39f864d3d73"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.41/veryfront-macos-x64"
      sha256 "c77a5b1d9f855c4477e86eef28b9afc370c598e03a44099ec529fa2e017f8087"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.41/veryfront-linux-arm64"
      sha256 "12b95b1529a68a58696d761f7715748c197b3686cca269e349f0ce1feb7f912b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.41/veryfront-linux-x64"
      sha256 "ae3b762456088c8715a7de46ea65a7183f818e4ade42fdf83421932ea0b41bea"
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
