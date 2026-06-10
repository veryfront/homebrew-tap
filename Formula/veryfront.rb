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
  version "0.1.758"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.758/veryfront-macos-arm64"
      sha256 "1801b25443b86d480361b6efa8e4baae0f22286b8ee999493ecda619572c75c8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.758/veryfront-macos-x64"
      sha256 "752c65eed3efae28e00ec36ea2fc61754c377540e8fa51440c79ba81dbad94d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.758/veryfront-linux-arm64"
      sha256 "26bf7c9fc7826573a30f90825b5252ee55c9484ed9f3adfafe3b7c0b0c6bff6d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.758/veryfront-linux-x64"
      sha256 "491340d5015fd2edc5b5923c27e93d5b7e938d2862256e9bd22997676474cc5d"
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
