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
  version "0.1.1158"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1158/veryfront-macos-arm64"
      sha256 "2dd7110a8cbf108b0dbc40f140303040ae175ab22162aad190eb2fadbb44bb64"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1158/veryfront-macos-x64"
      sha256 "a86d0645797eb56f5e526e2a6bcffa27fec90d1cdc2c0f60421371286c902f9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1158/veryfront-linux-arm64"
      sha256 "510a59a874b7cddaba04bdb3b5be5aee39ebf042e50fa40bdb5a33e3aea73510"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1158/veryfront-linux-x64"
      sha256 "134d0fa3d800a7fb25e73484d73279f5433367d9b3655f548c9460f75863b5de"
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
