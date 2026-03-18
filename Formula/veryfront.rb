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
  version "0.1.74"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.74/veryfront-macos-arm64"
      sha256 "cabefdba6d96cba8efbe3b81fd5162f40a393c1a31c3fd6523a43d61fe6c506f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.74/veryfront-macos-x64"
      sha256 "120bf78ab3c22314a9fd3a6e2e98a65757845999303c590f7273bdf86ba94c7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.74/veryfront-linux-arm64"
      sha256 "7125f46ff5ed4279f9b7841c6a9a21502716cb91a2160ba820538cfac3d0c987"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.74/veryfront-linux-x64"
      sha256 "d0574b560a7f87afedfcc475c673498f572442f455250509d6ad5a29af1b0e1a"
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
