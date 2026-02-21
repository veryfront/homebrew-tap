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
  version "0.1.19"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.19/veryfront-macos-arm64"
      sha256 "dd3fa37b834fd18a4f5fc50b54f14b21753f62ebc0a8258286b01c8cfe5d0ccc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.19/veryfront-macos-x64"
      sha256 "a1edd3ba371b99733e15304c8d16af993d113480e8869a1a851565e3ae12fa0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.19/veryfront-linux-arm64"
      sha256 "e1f458cbd81dce15ffc4d71a9bb514825a6a1757c31555477d8bc44e8ed00fd3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.19/veryfront-linux-x64"
      sha256 "6485c16d56fd2be45131bd5504078d170611e055d024f61c6dc4950e3f4baff5"
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
