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
  version "0.1.627"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.627/veryfront-macos-arm64"
      sha256 "ff55e7119eafed00d41e52b41c9501b00227518444081f2fc7fba1d2abaa1054"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.627/veryfront-macos-x64"
      sha256 "6be82b16722d57e1e47d756ee846bfbf4cd9998bd02e8ed8ac9a8211b1c65b1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.627/veryfront-linux-arm64"
      sha256 "4064f3724d3175f9973345b442a964672bf50778fc77ab3be9bdf1c5220bf3e2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.627/veryfront-linux-x64"
      sha256 "476ddee329808172f265c57ddb5e20a30cf8c9c0628f2dcb0814dd281fb44b5f"
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
