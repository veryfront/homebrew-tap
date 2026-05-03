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
  version "0.1.365"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.365/veryfront-macos-arm64"
      sha256 "acb5e0771eaf0ee34e3deefd9e4d8874a26de10f4e40f90cec28f334cb56cbca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.365/veryfront-macos-x64"
      sha256 "ca35ab5c5ee8fb90c90279ce684861e294f89ac6e6e399fab291cf19b74e1821"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.365/veryfront-linux-arm64"
      sha256 "175adf9870435493b1f225b3b62e837fb6ec483242bf2b199185729afe131469"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.365/veryfront-linux-x64"
      sha256 "9d314ff84d4a2145d5eea3c0efa7bf097a729ccbf73ac9333e949987e392f702"
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
