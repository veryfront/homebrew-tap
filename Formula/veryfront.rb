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
  version "0.1.824"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.824/veryfront-macos-arm64"
      sha256 "9fa756ec6d315b1f2270ba4eb360f0b90802c63e57f8a2d494bba0fa1292b960"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.824/veryfront-macos-x64"
      sha256 "4992c4d48ae79843d31dd2e24bd1da9afbe949ff9aaf3ae9928e052be6e511d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.824/veryfront-linux-arm64"
      sha256 "896b81381f6857d14568aa1790c8ad03eb73cf963777e8b186cad5daee226877"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.824/veryfront-linux-x64"
      sha256 "d2365e5f1e5cef7696793b566b6b89ccc62ae0761f3ebcfe8283796f45111a23"
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
