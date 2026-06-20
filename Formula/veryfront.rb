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
  version "0.1.877"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.877/veryfront-macos-arm64"
      sha256 "3ff29cb6148043b0056e7c95ab6bdd3f9000f6797cbe3a77d3c26b555451bae8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.877/veryfront-macos-x64"
      sha256 "6bcffbbbee1686123e6fd48d7378e8268f8b937669c2f4fe97afc4b309be685c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.877/veryfront-linux-arm64"
      sha256 "9f0b2df1c881e4e7c6465ea9f4eebfe111215cde57cd141c98360246cbb47d07"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.877/veryfront-linux-x64"
      sha256 "a0aade81f5f3dbb556fcb022abdb422de21045a69a9e6df294a9392bad5df487"
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
