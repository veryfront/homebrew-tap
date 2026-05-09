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
  version "0.1.452"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.452/veryfront-macos-arm64"
      sha256 "eee9435d837e896c405ea5aeb575cf931767daec30a374afbf3166d63f5e0db3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.452/veryfront-macos-x64"
      sha256 "a0572e2e50e45a64049f78bf6d90c195cc641889e017719a7081a4cf5896bac1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.452/veryfront-linux-arm64"
      sha256 "d3dfe678f504f9622cac932a80bad4c3e9af7d0ea7b9d96513eaa78c20dce625"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.452/veryfront-linux-x64"
      sha256 "b27303ec58cab9d9f8485d31eb3d8677af0865a4c5b637dfbe6636bf4fe5053c"
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
