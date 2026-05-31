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
  version "0.1.619"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.619/veryfront-macos-arm64"
      sha256 "e677dbd09abc3a8de72a74cb8c22f9b65b7cc7a3ea4c47c8db3cfa549429214d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.619/veryfront-macos-x64"
      sha256 "6817ec57fe37fbd0bec37356b664d3f813c0887ce47e5e7b5ff0c820dbd9c27c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.619/veryfront-linux-arm64"
      sha256 "9305c513d86a8ec70cfe7fefda5f02ff96b2c43515bbea5c881c2e60116524bb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.619/veryfront-linux-x64"
      sha256 "57f0db00128df86542cc114c3438d246434e2cea0455443b7671ec649f14c638"
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
