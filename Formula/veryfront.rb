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
  version "0.1.1213"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1213/veryfront-macos-arm64"
      sha256 "b98a34ebb01a378f03e27da15068a835f45c8f13c59281c92b4461e5593ce1bd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1213/veryfront-macos-x64"
      sha256 "1d3eb671e8d727939509a86a8ca025b3db6e0ad15e6ef106dde1658f3108c771"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1213/veryfront-linux-arm64"
      sha256 "941244fa312d6183e38e6a4837d761214de62332121b2ae4e21b44ccb76b1a75"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1213/veryfront-linux-x64"
      sha256 "6e5d23f677f270169af4bf317e5b2f163674381bffd0f678f878813146eb1d5b"
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
