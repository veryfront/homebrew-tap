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
  version "0.1.799"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.799/veryfront-macos-arm64"
      sha256 "5f579f0318ac132d0b0c8f8718b0cc34e9f1ebd94d291e8e20021080df3a0cd4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.799/veryfront-macos-x64"
      sha256 "9da071d3581b684b28905d8302da9799b9643fa5c8c3785f1be5fdd72a00d0e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.799/veryfront-linux-arm64"
      sha256 "002d21e3acf334f8deb77b33536ac4d641fcd35fd68dface86b19352d89bc22b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.799/veryfront-linux-x64"
      sha256 "55391643666bf5f17c6533962cf6693c634e9be1597ad7d6e497306fb90d7d34"
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
