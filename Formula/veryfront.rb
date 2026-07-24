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
  version "0.1.1127"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1127/veryfront-macos-arm64"
      sha256 "467182904c1aed6062129faaaf36aa278ba9458f90f415b9637395a041fb52df"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1127/veryfront-macos-x64"
      sha256 "1f1425b60fc6bc462683f0be033526e67d0704cad3c19958f16bec7e6a337998"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1127/veryfront-linux-arm64"
      sha256 "006ac39c6a59524e859cd51b5878d81e326f4e7c81434d6b42b0c82155942d21"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1127/veryfront-linux-x64"
      sha256 "4b32abedfccf4cf2830fa8bfd6a3ba99f8b02ffe468a72be210989694e5c8e37"
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
