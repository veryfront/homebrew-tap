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
  version "0.1.762"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.762/veryfront-macos-arm64"
      sha256 "e898bf5df52e9ebae5bd4b6c5a839dc6d13d8246ddd0251f291d27ceb322d65b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.762/veryfront-macos-x64"
      sha256 "a809081e5b7d4cfb88190fd7499047dab5f26dede75ed6075e0ab04fd3b298d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.762/veryfront-linux-arm64"
      sha256 "f03d92236652114cdd2d3611b360cb3a7928e5627d73884ad553f64bc0b4eb1e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.762/veryfront-linux-x64"
      sha256 "24bc2be52cf07cc92dad99fbc48dbf500dc490c557ff30aa6b38a6644b8aa0a1"
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
