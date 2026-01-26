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
  version "0.0.78"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.78/veryfront-macos-arm64"
      sha256 "b852b17d759246d4bd78fd7cae0bf3026ae6a35b129c961e765f03b3d2a5f7c6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.78/veryfront-macos-x64"
      sha256 "517c2479a497a6b69701cd3bba3bf10c864691fd3ec6479e9411c8817a0237eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.78/veryfront-linux-arm64"
      sha256 "d32b7a0371f76c724b58c51155b9271d1a2e9d43264ba99bae872d0e0ba85f93"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.78/veryfront-linux-x64"
      sha256 "514e3b40bf4b70b38a458b4d3a9babcec17c6724c951c29ed87fc5ae0a62fd5d"
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
