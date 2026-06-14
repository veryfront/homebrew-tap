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
  version "0.1.805"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.805/veryfront-macos-arm64"
      sha256 "2616d36770844b2a2c4ebe6c8d07e364078b390776015288286e3eb1e9929a1d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.805/veryfront-macos-x64"
      sha256 "935d16c85765ea6949a107c01472b128626aa040f5af9a22a213c6913bc18aa2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.805/veryfront-linux-arm64"
      sha256 "8698a9140f033827c84ab740b96f54d8e33ba889a034e567f060d4d6f87036e1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.805/veryfront-linux-x64"
      sha256 "f13391b0cd6f11aa6c3753c0793e9b52128911d1732f33e20d656d8f2312cd66"
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
