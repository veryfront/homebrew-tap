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
  version "0.1.1208"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1208/veryfront-macos-arm64"
      sha256 "b2db29a97f509ff428271921a06e402e719bb31ae7e0ed8e9218880d6628ecc8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1208/veryfront-macos-x64"
      sha256 "bf9ae84cef07ef0fcb2baa22969de8112d34853a16ddf8c8ea4e2684e4cc05db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1208/veryfront-linux-arm64"
      sha256 "f7e4803b6c71fa5bd9028bbf9405c6a9d9cf211f583928e69cc8434e0db80823"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1208/veryfront-linux-x64"
      sha256 "5981e10f09a3ddb36d842aef041e1fd63cc84175ad95b110f83c8e21a5c728cc"
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
