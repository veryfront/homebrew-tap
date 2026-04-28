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
  version "0.1.317"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.317/veryfront-macos-arm64"
      sha256 "ca0b45e49cc8b92faec846654e505b960d907f243be29d073fa5df15744ce2d4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.317/veryfront-macos-x64"
      sha256 "58845494f64a865224d30768080351d4e8bbbbdb9bad41424eeaeb07d55f3c70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.317/veryfront-linux-arm64"
      sha256 "479b3be1b1fb2e2c64983843018e15b20a6907ce4a6acd626576888da8c0b0b9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.317/veryfront-linux-x64"
      sha256 "a96c222a8cb5dc1134b112f5261d31008106146b50f6a4a1ace8742e1f3d6a3a"
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
