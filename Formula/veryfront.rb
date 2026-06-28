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
  version "0.1.965"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.965/veryfront-macos-arm64"
      sha256 "819b9158580064c40e80c978d86293391f8f6a513a04ff97bcefe33340785949"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.965/veryfront-macos-x64"
      sha256 "e154294898fcf85f3fb317b498851ec23d126820b44d2ea8faa74dc662c0490a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.965/veryfront-linux-arm64"
      sha256 "c2f4c118afab2756c8cf32b856756e9b2e7e0beb448354c3c252236a2cf5982e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.965/veryfront-linux-x64"
      sha256 "8d80d12cd46677b82a217c90ec103b5d3c9faa73130ab14ed7c45b53ed0b36f6"
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
