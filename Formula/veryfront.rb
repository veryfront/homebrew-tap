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
  version "0.1.1118"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1118/veryfront-macos-arm64"
      sha256 "7ab6e9dd668d85e04c8df0ea787dfb7e7bf612b96a50ca5473aa98df0e2dd5f0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1118/veryfront-macos-x64"
      sha256 "c679ed2239317c58055ba9c2a26deb6fd9b308249af07d2a6934868fb4653d2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1118/veryfront-linux-arm64"
      sha256 "e8f947429861f56ae22d25fe3f88cff86a95441fa69504bdbb6631428475dbb5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1118/veryfront-linux-x64"
      sha256 "d8cebea7f6d6880becfdb01fafa3ecc80af810c69008e7897e307891534f0929"
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
