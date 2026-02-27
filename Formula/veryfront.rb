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
  version "0.1.32"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.32/veryfront-macos-arm64"
      sha256 "b9ccd877946b3417917efda366771575bf4cc93c3d2b66f1badd1b6e4860dc52"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.32/veryfront-macos-x64"
      sha256 "0b2b9aa8efa40f6f2c147271c89dcc96e64eea8538e35afb49ae6eddd7f9c9d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.32/veryfront-linux-arm64"
      sha256 "9099c31d48f01f038bc7096a380a8a0d4347d78dda887fc30d9c9a55f7e5a4ec"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.32/veryfront-linux-x64"
      sha256 "07afb6b350ad59e379cdb47d1546369481048ccbbb4e2b2c0744be5a8b042bb5"
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
