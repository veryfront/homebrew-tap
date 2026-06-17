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
  version "0.1.840"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.840/veryfront-macos-arm64"
      sha256 "df94ea9ab6094c0882e815ebd3229b4531337a8182318de998e1f9fe3a877595"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.840/veryfront-macos-x64"
      sha256 "cbadcaf505ba0af778987d04483ba1648d04299978b199eb78beb25337943768"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.840/veryfront-linux-arm64"
      sha256 "ba1d4a049361dd9a06ba1d50a5c5ac47745da46143031fa4354776b13a39f030"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.840/veryfront-linux-x64"
      sha256 "fa42aa0cbb5f0dee104ff26f72c1db5178fbae765cf482fec1fbcb15e1d5d452"
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
