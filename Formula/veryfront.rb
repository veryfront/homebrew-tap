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
  version "0.1.31"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.31/veryfront-macos-arm64"
      sha256 "c9cbeea479fe786c827e7b4aefadaad1a3542d0bb6ede9de846f2b9efe1602f7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.31/veryfront-macos-x64"
      sha256 "e74a0f81df2bd443d43e723e5b8ea31597dab73ae23f8dc962466b9cc387ef7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.31/veryfront-linux-arm64"
      sha256 "513e9831ebfe9114180205c3a472acc190a2a9395b8787d2864d1cee84aefa9b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.31/veryfront-linux-x64"
      sha256 "fa384e9a9f0ff7a8369c2586e7b2f01d5827effb170eac6db9b4966c7ac84cc1"
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
