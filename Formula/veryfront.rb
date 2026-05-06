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
  version "0.1.401"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.401/veryfront-macos-arm64"
      sha256 "8ce766a48ac77790c1dc1d2f4ebbbc3d0390704c37c068351db76efe25b38a0e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.401/veryfront-macos-x64"
      sha256 "15820b8b05a62dd84d2082d6a20ca8db6f6a8c95f2fc958a34c1f25709707d30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.401/veryfront-linux-arm64"
      sha256 "9aabb7dbb5db0b1ae05ea938fca4ff1de0a39795cc7f371f9730c326b23a3517"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.401/veryfront-linux-x64"
      sha256 "e4c792dc917eb39d519d31209d887f4e24cd7616ba61a923f93a1ca4b3968759"
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
