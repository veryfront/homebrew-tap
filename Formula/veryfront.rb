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
  version "0.1.293"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.293/veryfront-macos-arm64"
      sha256 "ad929eca20f70ac0ab5605520262bf82124e41a73e57f0ddec9a356e7e0e7ee7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.293/veryfront-macos-x64"
      sha256 "a06ba0824d4a51015cb70840a22b2feeb35602a34c26577f80738833a26a8779"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.293/veryfront-linux-arm64"
      sha256 "f0b00f2648c5f808d335a3f92c1698d894fd83ef851e2e39c3f3c5fc4eb10f74"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.293/veryfront-linux-x64"
      sha256 "f4933bde1a9f1e397676b9f498bb05fd42d3ea32a65c419dea90bcc92bdbbdf6"
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
