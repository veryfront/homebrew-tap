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
  version "0.1.159"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.159/veryfront-macos-arm64"
      sha256 "a7881a4c1d855792cb149fc72970996210716af3a17a7806147cedd520bb17a5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.159/veryfront-macos-x64"
      sha256 "3f66db7aaaf194806821b8aa0f2d87718dcc87b42452b81fb3d06226951dca21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.159/veryfront-linux-arm64"
      sha256 "405c25ac56fe4fbd49c932812c417477712869072dc477b66ffabf4f4e04bdac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.159/veryfront-linux-x64"
      sha256 "cb53bbc06784982dee81583b11e5ed9aa3ae90e75e597f96efa2eb52b95af681"
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
