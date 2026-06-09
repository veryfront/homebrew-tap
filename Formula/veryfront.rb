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
  version "0.1.738"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.738/veryfront-macos-arm64"
      sha256 "b243f3225d5caa1c620c48e49a9873e15237fc8ff2a43ccb5d3ce2a396d28521"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.738/veryfront-macos-x64"
      sha256 "6c0647eac41ab3adf7029d9dde258c08a1a2fa24887bdad9d397ca2b6f15f699"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.738/veryfront-linux-arm64"
      sha256 "671f8c76a616d85f58854ea444f7595081cee51685758ef3c8741a350dd97e16"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.738/veryfront-linux-x64"
      sha256 "2610f899f0ef3e44663b29432d2a5a02d7dc2beed1cf2e2543d0eb565edb530c"
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
