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
  version "0.1.496"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.496/veryfront-macos-arm64"
      sha256 "0ee584eca26cd3ca7f56251142f0bec8c446ad922eb533ca18e9bd185b34fe07"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.496/veryfront-macos-x64"
      sha256 "83400e2e67f2441f218cd32dc1b468f691160027853e4086a3cad9ca888e9dfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.496/veryfront-linux-arm64"
      sha256 "d09a06ff126a23ace96522cc633694c69d5b28af48465ad786dbd9f8a57f157e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.496/veryfront-linux-x64"
      sha256 "5d0cab55594f06c85a44f44335a77f579783a4024b6e2c0039b84232a620c687"
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
