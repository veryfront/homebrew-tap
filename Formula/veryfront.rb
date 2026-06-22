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
  version "0.1.897"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.897/veryfront-macos-arm64"
      sha256 "1e1fe2db07e9eae366d23e73871268b37cfab9666e7b4b246e11ab6aa51cbb03"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.897/veryfront-macos-x64"
      sha256 "01cc707f67a4ddf7e9ea73d7d93b66db8217222c8a87c4d1603f6dac37fe4b80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.897/veryfront-linux-arm64"
      sha256 "557d2a5670fe993b89e15dee121492dd1dad9c7156acca093aefb003900564ad"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.897/veryfront-linux-x64"
      sha256 "5b2eceeb50c00f8a786f5b93a4edfc522804fe96d4ea127bacee4f422c797bf8"
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
