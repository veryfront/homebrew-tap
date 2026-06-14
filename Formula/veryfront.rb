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
  version "0.1.796"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.796/veryfront-macos-arm64"
      sha256 "5b4e64c4686fbaf97889d0503317a281822cc6fb91dbfbe0f3eb00a8d737fa4e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.796/veryfront-macos-x64"
      sha256 "ac91443264c39c8ea16d4359db4011155715f0d4be824f26ffbc79c6db730316"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.796/veryfront-linux-arm64"
      sha256 "e2fdfd9a2bd274bbbed4c6088d0437f1a600d22af554dd59b0feac2d0bc2db95"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.796/veryfront-linux-x64"
      sha256 "70e9412ef3b7df8fe864d749106101ae603c6e1a413d9818bf544f8068162acc"
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
