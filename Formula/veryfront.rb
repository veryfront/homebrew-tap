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
  version "0.1.1099"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1099/veryfront-macos-arm64"
      sha256 "cead28d9ed71bcde773e7f8731933db267546f5864848918b981e65e586e7fa9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1099/veryfront-macos-x64"
      sha256 "a4f55f2c17e9a4369aee442ecf480f44e874bc3aa11705e28888f0a8bd184de0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1099/veryfront-linux-arm64"
      sha256 "3a5c465fd9280be5cf15c8d4824a3f64155d9a19e53e2e66872021f005dfa730"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1099/veryfront-linux-x64"
      sha256 "bd25b2982701b0858d3b8a858a222bd3fbae8132b0094270b599709677927411"
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
