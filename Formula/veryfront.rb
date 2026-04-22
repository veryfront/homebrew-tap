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
  version "0.1.255"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.255/veryfront-macos-arm64"
      sha256 "03fb518e3e793ef08e2147a424314ed6d3cf6997807ca455182bfb6055047fc0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.255/veryfront-macos-x64"
      sha256 "50dd5a278600a6f8f5f3201fa94d4b8100d696b03cc060b634b1471a1b9c95e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.255/veryfront-linux-arm64"
      sha256 "1fabd9758c6e333c938be2340caca445e5d0f6b357d5284c49970d53f8c0c26a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.255/veryfront-linux-x64"
      sha256 "f101b2f2c5daf0dd081f73f3b0ea757e3b07fd51616429d082158ad8600d8340"
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
