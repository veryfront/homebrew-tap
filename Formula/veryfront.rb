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
  version "0.1.795"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.795/veryfront-macos-arm64"
      sha256 "71ba8708fa82eec7fa6969217f02bf5111846aa0765e4363c7c223ca2e1c9a4a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.795/veryfront-macos-x64"
      sha256 "e6ca02ca8db67c3d17055cf7d0e3c9f1406f19f8c026ca5e9af3080d0a6ed1aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.795/veryfront-linux-arm64"
      sha256 "762646688203e603f89a2d59e48391acefa8d4c547cb1cf64a15e66ca803ebfc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.795/veryfront-linux-x64"
      sha256 "619f555a627060a5819c882193357735d7fddd03807db1ae0228dfbf8f24ec5b"
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
