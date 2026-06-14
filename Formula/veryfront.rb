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
  version "0.1.797"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.797/veryfront-macos-arm64"
      sha256 "021bf63ad6dbe2711842b15a7da61d0b6e26f9dc478b53cf639147af9234315d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.797/veryfront-macos-x64"
      sha256 "a2050c7ae71d62ea1df7575abc0711fff1192d53f4876c85b84986541f5e0ef3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.797/veryfront-linux-arm64"
      sha256 "7b98360978185e70b5e116e5effb24aa8c248a988af162036210cffe6af6fb94"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.797/veryfront-linux-x64"
      sha256 "694b417547e196ca3463d7836790fa70b81376aa039f71e3690efb88e786d007"
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
