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
  version "0.1.625"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.625/veryfront-macos-arm64"
      sha256 "63cf4ecf5b166bb1fbd51b1000df5435aad831d8856542f76807eb50ddaa44f2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.625/veryfront-macos-x64"
      sha256 "18ee8987a29c3eb426c914465b33043e5c6913f2d377cfddbee06e8ba27c89b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.625/veryfront-linux-arm64"
      sha256 "7542947d00df984f36d885f2a22a18afe90bbdad2a17bf53931cf5363f6269de"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.625/veryfront-linux-x64"
      sha256 "42ffa601961a905a8473ea8563e169cd5c066f60b121bbe696f549740709658f"
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
