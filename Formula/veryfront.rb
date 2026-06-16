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
  version "0.1.822"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.822/veryfront-macos-arm64"
      sha256 "dc9613a15032ce2a60a895c84677bfb647e5b977845caf13b56c4a2d83eb434b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.822/veryfront-macos-x64"
      sha256 "83c402a43cb87a8c402c5d7ed196358021e313f3e8febab2c92923205ec6bad7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.822/veryfront-linux-arm64"
      sha256 "ad8a091f93a3843cff8a643d747a7412056e9d20b8a1f078e2385996438e7bf8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.822/veryfront-linux-x64"
      sha256 "56c47e9ee66a6b139b214742ee17c094687390030ec59ae43da9bd6ac4ae75d6"
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
