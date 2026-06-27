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
  version "0.1.952"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.952/veryfront-macos-arm64"
      sha256 "29e88ea36b8019003a61fb046428e5edbfc81516d76d8416106cfe75f8cdba51"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.952/veryfront-macos-x64"
      sha256 "e93e4a75874c93c0e576f969d925e1f9ac2d7c4c2737231d0664caab067f6d90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.952/veryfront-linux-arm64"
      sha256 "5371245fb26c66b221a79d144dfef0978eb4fa17f885d98cd39bb635142ac24b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.952/veryfront-linux-x64"
      sha256 "9861d05585d90d13401ac556b676d7c798a791d70ba6dc2c0601b7246a52fcfc"
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
