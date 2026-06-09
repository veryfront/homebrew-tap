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
  version "0.1.734"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.734/veryfront-macos-arm64"
      sha256 "f1eefd0578937bcc5ed1b0afe6e50f4e9e453f107dc31b83fdba507c78fdd78c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.734/veryfront-macos-x64"
      sha256 "950caca7ce9cf0885aa182cee2521c8a12f59180eea003acd08c60be56a2221e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.734/veryfront-linux-arm64"
      sha256 "2a74fc23c373a5c4cf7005b0df34201b1dcd51e52b6757a8031ca29c1218050d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.734/veryfront-linux-x64"
      sha256 "3225069aaf2501b8280c472f22d6ff87797ae93e45d0ac5c646d60f09753e8f1"
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
