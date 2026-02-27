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
  version "0.1.27"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.27/veryfront-macos-arm64"
      sha256 "5d5d321b7dfb80122e505bc3fc8b60b35c6c30afb4fccb477de011454e43bcd5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.27/veryfront-macos-x64"
      sha256 "fed8b0c98080881e0ce05fd94faa451f560a1984ae8c3e71e7f9e971c6d7c502"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.27/veryfront-linux-arm64"
      sha256 "9a43daff1e3d3b1adde4aba215c506aed687ca111f3234b91900e24f7b2eba44"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.27/veryfront-linux-x64"
      sha256 "1092b4d901d0c42c434f0981d9bbd4393fdbd9c445f8b48adb09000eb685e7f6"
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
