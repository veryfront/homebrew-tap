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
  version "0.1.30"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.30/veryfront-macos-arm64"
      sha256 "73dc7c4dddcb39c1ddb3857468b5b3ed63856baecedddf761b33af6a5e67e434"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.30/veryfront-macos-x64"
      sha256 "9d378d7deda96599d99ec24feca8a503072b097fd5b15c0f68d8197924c11eaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.30/veryfront-linux-arm64"
      sha256 "a83eb5bdccd7830752ea5dd1acabf6404e82aa68ed09eb52f0eb5687e3bedc06"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.30/veryfront-linux-x64"
      sha256 "1de7737e039d5aa2ef4d0bf5e7e1665b837a28d2e7e82c2c16313692b148931b"
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
