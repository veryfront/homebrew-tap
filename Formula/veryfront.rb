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
  version "0.1.1029"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1029/veryfront-macos-arm64"
      sha256 "cf32fdeb290a457a34633b75e79174559412e3ecaedc60f920f1828c84563d1b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1029/veryfront-macos-x64"
      sha256 "9158b7ad893cf409380664847e0949600ee87b58ba99a32e4dff8c2af003bcef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1029/veryfront-linux-arm64"
      sha256 "eb251bd6d9da9d658959d177fea4d1956913bd691e975c89454c4c546d5a85ff"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1029/veryfront-linux-x64"
      sha256 "9e4fa3964501396493dfeb65e8de4741ddcf85c90eb77bf53cfd88d0e1cb5e7c"
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
