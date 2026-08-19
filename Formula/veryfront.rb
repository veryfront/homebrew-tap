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
  version "0.1.1245"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1245/veryfront-macos-arm64"
      sha256 "3a6a5738fd5c7d0dd7e19b3333c2ee10c27d0c8b33055dc6ca0563e1200a6eae"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1245/veryfront-macos-x64"
      sha256 "dcb73d5c4180b88867f04ce3cd928c4ec7605c14d46c9a27389395d382e9d25a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1245/veryfront-linux-arm64"
      sha256 "fe7320e7be3b3d4a00ceba8e94ccdbecb8f8864d8751d4bfd9733cda46f139a4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1245/veryfront-linux-x64"
      sha256 "742190720be14934c8ae212b595d446e0d163f5e6c8f27e68ab621077f41779e"
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
