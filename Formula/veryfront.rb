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
  version "0.1.114"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.114/veryfront-macos-arm64"
      sha256 "543382fe029bef88eb4f087d3dc05f0ccc3bb826128cd6c6504412a06819a731"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.114/veryfront-macos-x64"
      sha256 "d4876ab6b73948d8e8a74ce1c46679c93a18ac8822068a0c66518831d9cb21d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.114/veryfront-linux-arm64"
      sha256 "ebe7c4118e6a13c472e3dad25b5ea7d3e982ee980dfe7d445fe541f12323dd52"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.114/veryfront-linux-x64"
      sha256 "186ffd1c5f2d0199cb5799cb3e931b0615226c11f8f83c6d9b1f5434e38855cb"
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
