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
  version "0.1.460"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.460/veryfront-macos-arm64"
      sha256 "08e41b03d8545d146f570492393f936379c6442cfa04075f9fb1f2922f2677aa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.460/veryfront-macos-x64"
      sha256 "d505fa8a6911be4b7611ec4ee6355a0409414683a62b2a4e2282ecfe49a467f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.460/veryfront-linux-arm64"
      sha256 "a6b304e8e54677d0b149ebc369002346b346f85e1c605b151cdd61e2299fb990"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.460/veryfront-linux-x64"
      sha256 "0e4d37616a054c88c2e76e4896f8c1a6b6069ed53bde366bf4fbafa4ca41ef71"
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
