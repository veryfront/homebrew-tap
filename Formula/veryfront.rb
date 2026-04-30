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
  version "0.1.323"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.323/veryfront-macos-arm64"
      sha256 "77f931afa2954450ef0ff56fb6fc67d1c082210f622c8bd5da94960d17f0b6f3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.323/veryfront-macos-x64"
      sha256 "f5d8559299d9af39232d9bcac8165945c37c37afe205289f9cb9a2ac6070b202"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.323/veryfront-linux-arm64"
      sha256 "b398ee71aa61463f6874a095b83b95d61b477221a3f46deb8c569688db8345a5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.323/veryfront-linux-x64"
      sha256 "6b0fad76579bab831c21b842e130875d9ab4a532ceec89daf0bc4a3d23bad9f8"
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
