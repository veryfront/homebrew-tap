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
  version "0.1.847"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.847/veryfront-macos-arm64"
      sha256 "660c443e33bb758dd42b8de176b0fcc3a9c503f6b175381ea6556cb2f6ca4cc6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.847/veryfront-macos-x64"
      sha256 "3e6d19ded43958f76ada02bbcab47046ee56f166180c6fd7a50cc2431c78e6c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.847/veryfront-linux-arm64"
      sha256 "324bdde4cd40aba1fdb4b47cb5368501662746d6c1a4ddd24219a837fcfe77de"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.847/veryfront-linux-x64"
      sha256 "2baadd9a6deec2402ca1f3376f4624a710103919edb3febcc8572af488ac0170"
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
