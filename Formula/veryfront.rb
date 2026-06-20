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
  version "0.1.875"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.875/veryfront-macos-arm64"
      sha256 "6c79f7f3a9184caf5730254dbaf181db27c1b05d7e829efb7c6fda49edd7c937"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.875/veryfront-macos-x64"
      sha256 "8bf02f724dd510b114f14433feaa577b3cf4927ca2165d75e64f019b0d05719b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.875/veryfront-linux-arm64"
      sha256 "12d6d12191f1694145a24c7d8d2ba46865e82daef56038a9790210abfdf7b384"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.875/veryfront-linux-x64"
      sha256 "5ba423ad8d3b249ffa85c73c9ff6db193059dd4092a5cdcabcae668fb1cc0c45"
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
