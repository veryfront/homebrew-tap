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
  version "0.1.1252"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1252/veryfront-macos-arm64"
      sha256 "cb9f20d95594da114eb76bfdd3395fb3b5c3e7290ccd2ce250a89fb25ef733ce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1252/veryfront-macos-x64"
      sha256 "0d6b2995bb5bef03888b6ee3d91cd5b7f4337122d8548f07c7831e99f29f91e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1252/veryfront-linux-arm64"
      sha256 "4f38b1e75ece9df62ab25fef330079adaa4a03f8bc6d86773048bbdbfc6a82fe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1252/veryfront-linux-x64"
      sha256 "565042b000ca9897a4d39ac28b89d070d64d6c44bfb174356d7d1c51bc4e4922"
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
