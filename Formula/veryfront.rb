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
  version "0.1.77"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.77/veryfront-macos-arm64"
      sha256 "5e66ae47df971c7284c56cacd5aeb4276729996cb2b250c6c0fd95e12c1ed109"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.77/veryfront-macos-x64"
      sha256 "c4391ec17fc4831dd86f86a726f96f66519d9a2410ffdbade5a335bbe48f699e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.77/veryfront-linux-arm64"
      sha256 "22a29339db37501697354d9911435ecf88340df99b8f1a7f1836fa61ccd590e7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.77/veryfront-linux-x64"
      sha256 "b2e725f5f61b8f7504bfc98593181cf85b7d3dd6ccf6d5b8d02dc72cf7c8f8c3"
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
