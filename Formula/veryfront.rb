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
  version "0.1.231"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.231/veryfront-macos-arm64"
      sha256 "8fc7cc1af443f5603c5a698eeaf4754b5e2f95ce980f7f47a8d2fda9dadb130c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.231/veryfront-macos-x64"
      sha256 "220b170e690cf42da36b7cefbc38fceff2891409c82621b41279fc13e98c6669"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.231/veryfront-linux-arm64"
      sha256 "71fb582fb8cb3cdc8f7cb2e01c799800b37c62c9eb32f258d72b1ff42c6e6ab7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.231/veryfront-linux-x64"
      sha256 "bc9bf94da4db85a13952c2770db34fade7b9557dcee05c2b3418e13b37f7731b"
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
