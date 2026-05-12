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
  version "0.1.499"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.499/veryfront-macos-arm64"
      sha256 "218cf78150e4e1a5d7c80e6c92fcdd6edfd3f14e6cae62a65a3ae8ef978186f4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.499/veryfront-macos-x64"
      sha256 "100f8d5b17f26f536b1a8fba3a67450e1bf26461b527557a3c83fd9e47430b40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.499/veryfront-linux-arm64"
      sha256 "567db3d11e74ff60f25c14f83c1d9a449c5b397e68646c0d078275cd3e74b6f7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.499/veryfront-linux-x64"
      sha256 "bbc179f875e97c37b99dee028eb0f0bb7e23ed0bb80a4c828fbedacb839b2b3f"
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
