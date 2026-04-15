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
  version "0.1.210"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.210/veryfront-macos-arm64"
      sha256 "f826a9c5ed2da288bfbeb69b3f1c5774534e8b9595a7315999470e9cb4ec73b8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.210/veryfront-macos-x64"
      sha256 "e42fd9102d07af248d0e0027400945bc566d8d9c8e4f750115c124874929a245"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.210/veryfront-linux-arm64"
      sha256 "60944a786e25bc42880d1058e859cec28d6ad75848bc4c3694d641c9b99184c3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.210/veryfront-linux-x64"
      sha256 "b6bd2b47e2f8dec6682237740c2cf244f468628667c29a87f6476bc6ca52b13c"
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
