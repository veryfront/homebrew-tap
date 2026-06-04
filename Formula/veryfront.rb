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
  version "0.1.663"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.663/veryfront-macos-arm64"
      sha256 "2f295c8eb634c41fa1a5cc01fd18399c6c48c7bd048317af4b3bfcca9e80ee39"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.663/veryfront-macos-x64"
      sha256 "d40fafdf0502f312ca5c1db327cd0aa93cfc93ab87886d3a642a1ea96028cfa8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.663/veryfront-linux-arm64"
      sha256 "94de94f2a6dd77936ee195aab2a28f9f2f013ec008316bf463ba53dd3deae173"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.663/veryfront-linux-x64"
      sha256 "33b89f01abe07f69c53c7de908f196c95c20ae97aa01bf407cf7ab2587839061"
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
