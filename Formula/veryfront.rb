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
  version "0.1.979"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.979/veryfront-macos-arm64"
      sha256 "71578818c6f76e3d629fe4e5a27eb6c6af4e35ad739340993d8f19613396decc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.979/veryfront-macos-x64"
      sha256 "77cf3edb9d662bb19ab7efe54f723fcf6a642c0f7d5b6885f745e662260ae366"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.979/veryfront-linux-arm64"
      sha256 "e43cb0bf5f40fc77d6c2c838dc163ddd9000bb90ae39649e1980a0bf5bd96de4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.979/veryfront-linux-x64"
      sha256 "59ec0c222efcaf2041b7556093342ebca98949410fff6d8cddf91b219115a769"
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
