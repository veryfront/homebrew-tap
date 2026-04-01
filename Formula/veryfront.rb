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
  version "0.1.127"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.127/veryfront-macos-arm64"
      sha256 "c1bdd86c9d467531b9f120e05fae7e4e44bff329247b2bad5a58daaa031fe037"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.127/veryfront-macos-x64"
      sha256 "b7d3976f5181952b9d9c8fcb623224f854aa6e98a2dd2e45936e4c0ee5bc09a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.127/veryfront-linux-arm64"
      sha256 "38e4b66520769397b4dff38de53919be8e1fc03c83c4b1856a5c75fbdb7ef52e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.127/veryfront-linux-x64"
      sha256 "3272ca7fe8f3faf589b2a3c6d2380105209718e9d21122919adfe6c7e220a4d8"
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
