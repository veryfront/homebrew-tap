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
  version "0.1.502"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.502/veryfront-macos-arm64"
      sha256 "d74d7e9d866c3725a3e3b4c77911b8255cb95efb9ff64d9308131c5dbd35489e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.502/veryfront-macos-x64"
      sha256 "a5a73713235db5c22be02a10dc54cdc3a101081223581b7a0c29975774ba14a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.502/veryfront-linux-arm64"
      sha256 "0fb6857a015aa3ae3fbfda986c6075a4c8f599b33f97b8fe297aca2030eb9111"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.502/veryfront-linux-x64"
      sha256 "fd0e2256c233ca954b62610aeb498f41c3231532d9ead916d8368e8fc5dce915"
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
