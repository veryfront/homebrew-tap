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
  version "0.1.715"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.715/veryfront-macos-arm64"
      sha256 "872c409772b0b19c2d2f89f805ca83b3773c23bf98280e424a76ff64b62837a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.715/veryfront-macos-x64"
      sha256 "0e45f4ceb7d4fbc07c5de2571a02de34e717373b58888cecaa897bc878a28002"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.715/veryfront-linux-arm64"
      sha256 "5e6fec534e26706e7157ba485c120056b89f5a126c08fcc33e11970a988651af"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.715/veryfront-linux-x64"
      sha256 "48e7da2166dea8cb28d8ecd3c89c39e2227896cca7c40bdc9fc20216f393d267"
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
