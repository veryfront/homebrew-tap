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
  version "0.1.1053"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1053/veryfront-macos-arm64"
      sha256 "0264e9aef0c9c30181cef9cff5019d7d3106b72daa0c15ed46dd6251d1825fa6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1053/veryfront-macos-x64"
      sha256 "33bc30e69e3c7d93da72a117b6b2c1f743e0e16b932eeb9520d496caa1e5a69d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1053/veryfront-linux-arm64"
      sha256 "d7bbf7b9f91b51cd3300ee28df04c27296072e5366a44a41feb7fc65cb185030"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1053/veryfront-linux-x64"
      sha256 "62c4562b21cb48fdee44b638c00cd83a31b5ecef6e0e19f05aa8ff8fa0efb9e6"
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
