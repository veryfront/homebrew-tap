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
  version "0.1.624"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.624/veryfront-macos-arm64"
      sha256 "2b83f0a6d9919b0b4cef2f2c6eecae448e674aba0f90d34e39a3964f668a6c94"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.624/veryfront-macos-x64"
      sha256 "5b82aea823153cfb0b48eb0596f610972e2b60344bec89b73851b4258787f92d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.624/veryfront-linux-arm64"
      sha256 "65ab8494cc7f0cada7aa0b13b91838894c657592dab237c800becbebcd4425b9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.624/veryfront-linux-x64"
      sha256 "b17ad19dc8cbd0be0d2da81dae1931191f6bef565d8de268640ee6bacd87a76c"
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
