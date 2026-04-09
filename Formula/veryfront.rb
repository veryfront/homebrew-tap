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
  version "0.1.148"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.148/veryfront-macos-arm64"
      sha256 "d080f8a7dee7b22db5c556c9f78b5b637e5df69dee1eb781f6ebf8c2a05befbb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.148/veryfront-macos-x64"
      sha256 "7f3ddbf91025a540ad90671ccddecca437ca6fa850b5889a436dea08d5854a31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.148/veryfront-linux-arm64"
      sha256 "2eec13ca9260f67614566c61d90923c4f7c7a0be2db09b11f81382b47ed33984"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.148/veryfront-linux-x64"
      sha256 "80e20ac1c76fce44cd1767da58ae9303fde803fba905386e143728c298d7a19b"
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
