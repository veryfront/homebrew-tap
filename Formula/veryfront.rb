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
  version "0.1.136"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.136/veryfront-macos-arm64"
      sha256 "e9eca76351554f40d2b3cc533fe800ca02a41daee2af21b1283ca415dec34ef8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.136/veryfront-macos-x64"
      sha256 "72fd1ee45e7152a4b71a9872d864c10927fade0ef536bdcc6d5a0c556334cd18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.136/veryfront-linux-arm64"
      sha256 "06e7e71b86f024b4f3b7ccc1d3e96b6bd752831c51aca3e99a9617e3fb572b2a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.136/veryfront-linux-x64"
      sha256 "bf4aa64f5116e34f53c30f5c8aaee0778f64cfe00869cbf9806eb0ad12d25fc7"
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
