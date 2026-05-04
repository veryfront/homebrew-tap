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
  version "0.1.368"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.368/veryfront-macos-arm64"
      sha256 "8d166ae6d4d64f663bb612a0164d9ef47e371ff9c6b2bdc00c38b4cce3fa0cd4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.368/veryfront-macos-x64"
      sha256 "00d9b75219d887f3bb6a4dc7178cb43480781e98a2eea823982aff0d2ba37797"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.368/veryfront-linux-arm64"
      sha256 "ec832262cc61c3ebf696dab2882302df19459ff86360a534400645f226da88fd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.368/veryfront-linux-x64"
      sha256 "cd404cd382d76e023b56d0c075927ab889ab58e467b859f5a9f6f62ba401d636"
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
