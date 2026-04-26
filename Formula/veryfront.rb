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
  version "0.1.272"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.272/veryfront-macos-arm64"
      sha256 "03f5d260f3e06653cba15c5719c6fe6aa993805a5e7b3b72324b513a8c6931b7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.272/veryfront-macos-x64"
      sha256 "6ddc5ccfba5bf6bdf5de0ecae647a21b92b27655ee92c0b6fab7cad59449bbfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.272/veryfront-linux-arm64"
      sha256 "f2352a18ba3d420abc35a366efea6ca69d0a05d4e8f7df87a474ff5f5e528bca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.272/veryfront-linux-x64"
      sha256 "d6c3e9b07117af5fc4269dce6214a39e697fd3a953175dbc1a18e18b3f8bf8e3"
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
