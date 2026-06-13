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
  version "0.1.775"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.775/veryfront-macos-arm64"
      sha256 "8a1756eee152d2797bc2fba5a437c9f0afb6044261f4b6675a50f92ae82e1e09"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.775/veryfront-macos-x64"
      sha256 "dd1477e06f43c60b2b567b8c46fed1d71fd51c06a8e6194d51f04ad9dd2348aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.775/veryfront-linux-arm64"
      sha256 "4881ec87f6cef8cc14d555cc8b5c204feea4dfa44d81895139d3d5f2c2812b55"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.775/veryfront-linux-x64"
      sha256 "bedf5b7455b49c69e9c494b0de29e26ac04e6355f86e265177777564f4d57c9a"
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
