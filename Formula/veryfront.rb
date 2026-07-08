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
  version "0.1.1033"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1033/veryfront-macos-arm64"
      sha256 "695cb45fc72c1c5cc42360bdcb0fce49d71c7f909ae95ead9f86301b781d3d1d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1033/veryfront-macos-x64"
      sha256 "37657e33a458af4010d614bd02b3911a744fcf6fe011005eacfaa52bda2eec3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1033/veryfront-linux-arm64"
      sha256 "63b2ddeb2e2e1651d7fd57ed1fad2edd2c305e4fd9e543c7cd094971db261d18"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1033/veryfront-linux-x64"
      sha256 "e75b7fe71513bbc754b1533185945124f08924e75081e279c7e47817e065e0d1"
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
