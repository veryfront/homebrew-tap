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
  version "0.0.82"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.82/veryfront-macos-arm64"
      sha256 "0e233ac115a839a2e4c3094efb361f41cc146aaee55a280c6e2fc90f76262adc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.82/veryfront-macos-x64"
      sha256 "bf4b5cc143760f1505702d84e35f31001833b72b97282c2ebfde3b653ad417cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.82/veryfront-linux-arm64"
      sha256 "d9b8ab40aa572673ffa139a4ec56854dc4890fce6d87be497678ecd6719143ce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.82/veryfront-linux-x64"
      sha256 "cdc49e98a9ab72cc98ebf2a29a3f7e440934afffcb1ba12767faeddaaa53250b"
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
