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
  version "0.1.40"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.40/veryfront-macos-arm64"
      sha256 "2ae17974390abb30c4a2094320ab75e57bada3108f0850273e483e359dc5f710"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.40/veryfront-macos-x64"
      sha256 "d90a3d2137f73822066318850af8afcf4c20e72460c0442d3e4ea814ba9a1973"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.40/veryfront-linux-arm64"
      sha256 "e0210bf9ed86bdcc42536efd8c43e13e0fde4765199f07731b93e035818a4d7b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.40/veryfront-linux-x64"
      sha256 "87fbb71b20f1143da1551c416012722bc7de616a10e338b24b834b5d1b84a26b"
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
