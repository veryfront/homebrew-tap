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
  version "0.1.201"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.201/veryfront-macos-arm64"
      sha256 "149d08a26c07eeb89ea7fe9b4aac00f59c5d67337664ca6fcebc272485c0c2ec"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.201/veryfront-macos-x64"
      sha256 "25aba872a6ee6d37e6210b7d3726fc1e38f8813a26118e3e9779596af0e39be0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.201/veryfront-linux-arm64"
      sha256 "2b83e131bc69c7cdc830bddc596a6417ac9509a11de25b40b94256402cd9c3dc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.201/veryfront-linux-x64"
      sha256 "f3cc685fba0ee52d74fe8a78904e6f39bded648dc5dd66f7b1a2021056b381be"
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
