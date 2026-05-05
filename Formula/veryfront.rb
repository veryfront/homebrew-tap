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
  version "0.1.381"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.381/veryfront-macos-arm64"
      sha256 "bac5888ea9f1884297e15af5db48b1fb0d3bab157ac06606e4591927d4e4cdab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.381/veryfront-macos-x64"
      sha256 "bd7505e83fb594ea1e2914a9d625f1e8cf76003553bba749a854bce76dba1a67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.381/veryfront-linux-arm64"
      sha256 "f2ffea144643d3f3f6b4430a914f53320d6af1f665606e64783d626f20747d29"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.381/veryfront-linux-x64"
      sha256 "4496a4bbdcf9849541859927ce8fa00bc6fbb2fb233aae46eafbe6ae57ce9d59"
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
