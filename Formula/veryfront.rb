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
  version "0.1.1183"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1183/veryfront-macos-arm64"
      sha256 "3abee5747001e702a2519195c50ffa1ec57de3975d1d2bb65832925b0f352585"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1183/veryfront-macos-x64"
      sha256 "8f1623ddb5f175a1f3dcfa01a23664281d5c1b96d87a8979ea4866c1de268139"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1183/veryfront-linux-arm64"
      sha256 "acedd5f29eeccce0f02a97c259dec47887a0829ba92dd2b71057bc5a03f13432"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1183/veryfront-linux-x64"
      sha256 "6afe030091e2eea1c308a276479d90467721c0fd7923493ccd55f47204509ade"
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
