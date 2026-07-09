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
  version "0.1.1038"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1038/veryfront-macos-arm64"
      sha256 "c6e06fd29f0cc55d9838314fbe752c9c0a9fab020af878e04696c9b7ef8951c8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1038/veryfront-macos-x64"
      sha256 "d08640a998e240255dd47c7663e8c4c17100e60111e3ebb582720453309e19da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1038/veryfront-linux-arm64"
      sha256 "48c1a4eb6d16dec808f2327f0f9c0923fb3895c3d0645f55cd519141256b145f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1038/veryfront-linux-x64"
      sha256 "90bec225eb87dfdc1ad00b63fc65d83917e40cd72f7d70e0559632a327d09975"
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
