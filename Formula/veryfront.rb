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
  version "0.1.326"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.326/veryfront-macos-arm64"
      sha256 "822c3ea01c72d1626fac8a434105bd84b144fd97996f2f3636f5cebb6f1104ee"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.326/veryfront-macos-x64"
      sha256 "97ed4387544716d1aaef4f05bb02214c8a6f5c8de2e982c62ec3c59c0a12e300"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.326/veryfront-linux-arm64"
      sha256 "7ce5448e425673d2a58f0d8ad332309e8ccce71cb97083148530e164e0e3959e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.326/veryfront-linux-x64"
      sha256 "3f995ccd0eeac89adca6b9744e21c379ee45eb6d7775adf05572cdb52020f945"
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
