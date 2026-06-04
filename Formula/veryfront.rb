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
  version "0.1.665"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.665/veryfront-macos-arm64"
      sha256 "527e5937394a46d1df982b51f4d5a9717653f5d2e77bf2f81c1f4d8e8160d92e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.665/veryfront-macos-x64"
      sha256 "3ea6e4e40c12ed6128691445f4d2548eaeba8f4616bbfe50af5bd6aea149d92d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.665/veryfront-linux-arm64"
      sha256 "1c2ae328a928ff1402bc5ba3f8a75411cfe1a7ddb353d58d3d0e02f2a15c538d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.665/veryfront-linux-x64"
      sha256 "320e97e1a0f2e63df28689651ce08358bb3508fa47c5b774bd13d9ba4d5625b9"
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
