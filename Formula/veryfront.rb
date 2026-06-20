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
  version "0.1.881"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.881/veryfront-macos-arm64"
      sha256 "95dece3fa3fa8e3bad91c10e7afe1555c1b09ee1eb5e9a08ca23d8526f25e071"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.881/veryfront-macos-x64"
      sha256 "42d45a9df5076a86661a8d2d4b777b6133b889314c32decf78757230cade1b7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.881/veryfront-linux-arm64"
      sha256 "9de9f80750f2351e7e7dadd78b75bd1d932a983010c0c72f47d2d0e6b591a902"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.881/veryfront-linux-x64"
      sha256 "9491285f30df65bd98b8024488ce844f93c204c6ccf51fe8fd35212b7b8a16d7"
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
