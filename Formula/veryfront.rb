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
  version "0.1.230"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.230/veryfront-macos-arm64"
      sha256 "2a563ab16fa9537d671318d40cee0dc1634c932357cd4c1446e8e7c2ae6cfcef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.230/veryfront-macos-x64"
      sha256 "7d5bb11e7cf4f86a3a2fa315cfca0192534cd5f563ad4c1a018d66be191d69e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.230/veryfront-linux-arm64"
      sha256 "961cc255739764e4713a8f0de34273b9832c55b136780286ce591e2e80ed038e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.230/veryfront-linux-x64"
      sha256 "9aea073507e0254aad9be1f44f81b0f16e4b417fa0ef19ef5aedc100eab002ca"
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
