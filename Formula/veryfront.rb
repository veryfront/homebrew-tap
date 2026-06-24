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
  version "0.1.922"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.922/veryfront-macos-arm64"
      sha256 "f6921e15b3127e2abb9c882b23b591d0a1f31c4b71d0e2c9653a4cd190c6d4c0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.922/veryfront-macos-x64"
      sha256 "ab11cac48f0299d7ca1ea33b5a4ad2b7ba43ac50c4e0c160244ea3a5daa31861"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.922/veryfront-linux-arm64"
      sha256 "4eda492b3746afb763849d49e8284f1961e7d23b329222fea0c3d1220c5ea079"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.922/veryfront-linux-x64"
      sha256 "2789448f7e59378e0a3afaef08fba964d344a76a35e3fae570a49a15f09b0047"
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
