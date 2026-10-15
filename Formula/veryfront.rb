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
  version "0.1.1274"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1274/veryfront-macos-arm64"
      sha256 "f2ca276c3ca3ac1d2ffb08cf6ccc8ff8886c2ed3a82a124f4dd2326bdfdf3948"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1274/veryfront-macos-x64"
      sha256 "1c6c1c1528c627270a7fbb271286fe0c519c1a12e69721665545f2e76b3967fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1274/veryfront-linux-arm64"
      sha256 "5c53adf208ecdc9e7476e591e4a4a978b27985e553059b4db83078ecbd8a689c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1274/veryfront-linux-x64"
      sha256 "cef67974a5d246ac91f5cb0077de27a263a1f58e51c932599edb103a72a78285"
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
