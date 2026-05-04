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
  version "0.1.369"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.369/veryfront-macos-arm64"
      sha256 "40deebf7542b80a2a2779f00691892545d915bae61ef9447e8bb3764fb3a12c7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.369/veryfront-macos-x64"
      sha256 "50b07bce247ee3f9d62801b222b2420f4e6f5455a8ca5b3696f307bcbaf2fe55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.369/veryfront-linux-arm64"
      sha256 "bd9907b14f11c34d8615cd92d3a1703559000d2ff14b089ec6e7d846ef3083aa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.369/veryfront-linux-x64"
      sha256 "c1fd2df3b23c4716397d43ddc35c247d6eb415bd2a2d73367800d40be34b265c"
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
