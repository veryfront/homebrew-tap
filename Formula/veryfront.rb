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
  version "0.1.228"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.228/veryfront-macos-arm64"
      sha256 "c7cb9eb1fb07e950aa0bc1530d4137876b6beae921b30037f95dce5452fafe78"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.228/veryfront-macos-x64"
      sha256 "769e8ab04b23288824e450ddf3d33ad6139c0ac4b8d6ef535ea5ce9d68ef0bcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.228/veryfront-linux-arm64"
      sha256 "15502380a507794b4a8e281ee40949a239dde25383f07d3376ba2a3f881bdc9b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.228/veryfront-linux-x64"
      sha256 "b132ffc2b0cdc76a49311e32f6e1af456b0134c47144b09445237df6c573a838"
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
