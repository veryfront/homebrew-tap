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
  version "0.1.55"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.55/veryfront-macos-arm64"
      sha256 "01cefcf7e9e0a501721d91ef977ac142d1afc1e71c72cee1d145f96522f66979"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.55/veryfront-macos-x64"
      sha256 "dedcc1ecbd72efe86858065c2de6d985f937b6d871f1e84b5ceddcd3bfe5bac5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.55/veryfront-linux-arm64"
      sha256 "2c68d3d93ec13cda79e3ca6ca1c5f155f75e5c2f89df98ca3fee1be599456170"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.55/veryfront-linux-x64"
      sha256 "7c0e4e93f19168221b17723a805264ea3a207aeedd252a22b76b17c0ff3ee6f0"
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
