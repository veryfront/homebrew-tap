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
  version "0.1.978"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.978/veryfront-macos-arm64"
      sha256 "097b3e9eff5a74a0aba3e1420472e8572e658c1af6f1d65a5a0c60fcf24f6d25"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.978/veryfront-macos-x64"
      sha256 "478b8881a6f930b33bd8ca6116e9bab4d8d046ec203dd57745d2cb49ac2c8957"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.978/veryfront-linux-arm64"
      sha256 "6947804f48e1d59d1238a23989be9d7e7515485ca4c486eeaa182fe51c076ae8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.978/veryfront-linux-x64"
      sha256 "a132f4170eddc407d1fac39f8a7a12052aa0f175e397ff9250e8f08f955dae18"
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
