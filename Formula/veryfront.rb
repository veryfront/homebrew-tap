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
  version "0.1.1157"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1157/veryfront-macos-arm64"
      sha256 "0b259be5240275bf1d3cd6f79ac56eb5a2b92521f8d0d2701268dbd2f6edc834"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1157/veryfront-macos-x64"
      sha256 "34cf8d6642284d316b7c65234e7ae6617564d543fa8a1a75fde4c3bc20ef90b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1157/veryfront-linux-arm64"
      sha256 "9e6a6738f297a2dbe97ebfc9941a32a287a94c7e5093f7ca0b867b60930a8b6e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1157/veryfront-linux-x64"
      sha256 "3a55e5a66f589009c042d5aeaede8865d79f5a1cf0c0c9edb14c46893dc83dd5"
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
