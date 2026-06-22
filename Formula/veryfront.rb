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
  version "0.1.901"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.901/veryfront-macos-arm64"
      sha256 "c5935192b02542c59449707a559c15180cb86d8b2cfe7992a6bb97f7e3a57949"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.901/veryfront-macos-x64"
      sha256 "1a7cc42355eb0da53eb55bf999f77ec4c5e7af0d98923ba31cd9f73e2abc27a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.901/veryfront-linux-arm64"
      sha256 "7380a79d6541ceb1c09f0d9fd39bcb32a796a4c6d6df2fe9b52fcf33fa0ecbc6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.901/veryfront-linux-x64"
      sha256 "ebf733902204b8854d74380a54a2bd1f2ff1efe3aaf655b5876e2c766b89f46f"
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
