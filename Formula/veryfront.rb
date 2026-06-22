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
  version "0.1.912"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.912/veryfront-macos-arm64"
      sha256 "5f60e9efd8601b29a33b0ad662ce4071a58092223f60f46519d9ac7809056c8e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.912/veryfront-macos-x64"
      sha256 "b06a6105a0549114fdc4c776383206a81bf21ff26bf94f33324a71834e71cbc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.912/veryfront-linux-arm64"
      sha256 "1af7482a8dc2cb7ee220fdbfb60b1639d87a8626ccfd8b516da03e395e7975d6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.912/veryfront-linux-x64"
      sha256 "49c9e65b7f7380174814832713acc409537957cd112a90cd7d7c8b0e6c8ebe1f"
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
