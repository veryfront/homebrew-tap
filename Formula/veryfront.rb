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
  version "0.1.786"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.786/veryfront-macos-arm64"
      sha256 "c03c6573a2d4e2593305f2d9444ca755a7656ef244bd9e33ab1ef6787bdb6695"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.786/veryfront-macos-x64"
      sha256 "6a18ebe2c3729cb68438829b594bcdb27a60dca4d718a4d54127103977a67e61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.786/veryfront-linux-arm64"
      sha256 "cfe37aab5e6044d10b8a614d3d24af86530f0b99974f792f5a9d768608a872f9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.786/veryfront-linux-x64"
      sha256 "4f1905608e0632855027ca9bf3d341a8c161b0c0a4e6b78eb955975c6f1a3878"
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
