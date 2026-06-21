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
  version "0.1.891"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.891/veryfront-macos-arm64"
      sha256 "53c97eb7136d10dac949a840f33dbfbc20f5e8594edc80d3341c2ad1c345133a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.891/veryfront-macos-x64"
      sha256 "c74d94bd9ab5ea715774c665f97ddc1ce0c4771b3c307ccfb3960a9f713cb80a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.891/veryfront-linux-arm64"
      sha256 "b444faa5efef552cb9a6ed853362b2d98dcf314d806fec88a258aad21822e569"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.891/veryfront-linux-x64"
      sha256 "044c51527ee0578e1a63b27569daf56fdd6bd291c136ec6a2d30b23bcb92948f"
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
