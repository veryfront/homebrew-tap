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
  version "0.1.237"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.237/veryfront-macos-arm64"
      sha256 "9768c1c578e9e5c74b96a69ad9d213bf7d0e7afc2894b88c7fa5de426d141d8c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.237/veryfront-macos-x64"
      sha256 "1e809b67cafd94eeff749d2d2fd41d8d565aee2124146b1f3c4883eb70f578d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.237/veryfront-linux-arm64"
      sha256 "6a0b6507a46a1724fd4b8b18f2dc16609fa090d8a0d005494f2cdcdebd125df9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.237/veryfront-linux-x64"
      sha256 "2e6ee7d2e9edc431c7af662df31c83442ebd34760ceca67dced286844b77ec39"
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
