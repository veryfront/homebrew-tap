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
  version "0.1.1095"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1095/veryfront-macos-arm64"
      sha256 "ea4589f36cbac76d8e06c3f00d120a72e8b621ca99997f1b6d77289e70dcc9f6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1095/veryfront-macos-x64"
      sha256 "4d2ffbfe3dfc824b43377db829616a60e889b42b300de606d0573aff3b3021f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1095/veryfront-linux-arm64"
      sha256 "f08105f792719cdf932b9d217d5f69a9875c667e28c882318ea17e29bd34b9b4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1095/veryfront-linux-x64"
      sha256 "1835cb7b962c1408c6321084528a1decc87c4f6b69c5b3766ef5fede0a6f0738"
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
