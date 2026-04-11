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
  version "0.1.184"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.184/veryfront-macos-arm64"
      sha256 "23358237d8d8c0fb62124868b0d03da5c33bd2edbcdc32c764dac0bcc0a62cf8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.184/veryfront-macos-x64"
      sha256 "47e094a79e631c903663c9f3d3bb1e45210b696fe570c386d83ba67174525c60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.184/veryfront-linux-arm64"
      sha256 "7a7fdadd1ed0e2653e8ebd3af726c0fc32276d56cb60efbc6a12d49c097cbc84"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.184/veryfront-linux-x64"
      sha256 "a406fe2d1d352713e3265998e78c97601676e1907a3d8d05359036d3c6f8dfdc"
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
