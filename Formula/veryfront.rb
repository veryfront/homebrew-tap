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
  version "0.1.415"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.415/veryfront-macos-arm64"
      sha256 "747104957c05213c43e9ecbf451dfdc26d3f47b3d8abd6a1f6a31b4ef97cb7f3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.415/veryfront-macos-x64"
      sha256 "1751bca967d15cc70ed4eac9bb62b3e2575a33340a638ceff99bf8ef0566d589"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.415/veryfront-linux-arm64"
      sha256 "cc7497295f9c569aad615b8ca343ee0037f0844d3db3e755d89fa694d5604e3e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.415/veryfront-linux-x64"
      sha256 "469dbd86b82584186079b63e60df2d626fa258a713b98d33fe6a8f9e49546228"
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
