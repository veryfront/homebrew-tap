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
  version "0.1.1168"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1168/veryfront-macos-arm64"
      sha256 "6a8596ce6bfbcf17cf835e68b7bee6303775b4a50d3096de120ea32a5c1ea4ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1168/veryfront-macos-x64"
      sha256 "72bf052a6da94e0c149b9deb89bf9cb2e157bd87fcc37df472aaa54f03d44e56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1168/veryfront-linux-arm64"
      sha256 "4e65b1267f0df032deeb4095866e77aa17e4b51fb7a22bbb6cf476f9d30f5a7d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1168/veryfront-linux-x64"
      sha256 "9270eb933e9e7a66838a63de81fd571c61be8b11f192b0710238ee434efce7c3"
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
