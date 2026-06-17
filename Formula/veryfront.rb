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
  version "0.1.846"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.846/veryfront-macos-arm64"
      sha256 "a54de73ec82b71b1ea89222d06fce89397f80f9ab4e7630943a8f8f748b02f02"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.846/veryfront-macos-x64"
      sha256 "351a906f17ccbbd5383980330acdf445a9a56e116e3fca4757030a220faa3d7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.846/veryfront-linux-arm64"
      sha256 "798243e0d4463e9590881e5002d93d8320d6b8cc075393d97f84581f406791de"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.846/veryfront-linux-x64"
      sha256 "f13f5ec7f46a8a7d83e40556447a7aea8af2dd6632bb1f4f14c7d2e2d57bf789"
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
