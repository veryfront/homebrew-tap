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
  version "0.0.97"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.97/veryfront-macos-arm64"
      sha256 "fc833f7f9131975485c19c9feb9cc2608534e47a084ad2fd89380f1ea9a81d99"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.97/veryfront-macos-x64"
      sha256 "76434a34cefd62a82e214799867dc2f6393c8cd550f43feaa95d8c5896339d8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.97/veryfront-linux-arm64"
      sha256 "3495a8911d8e6a7b1a9c8185047f013e9820fd34b78282423e7e21a03cb4cf01"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.97/veryfront-linux-x64"
      sha256 "1f3e7f94151073b0353219589989b743449b6f43dd3365d53d480bf08a68a748"
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
