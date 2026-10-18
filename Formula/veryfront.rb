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
  version "0.1.1281"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1281/veryfront-macos-arm64"
      sha256 "1e659d36e777cc6f0e5b846d3b7b76d69adc4b18ab1ebdcc06c956df1bdc759d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1281/veryfront-macos-x64"
      sha256 "fb792c53b44381a15cdc3e322f6c17d543d47896f08097e5ada3e01e4cb201c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1281/veryfront-linux-arm64"
      sha256 "74199c8c0bdf65d0b73bd7dae3e49cbd8802d80745cad972c569aa4a0c71305f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1281/veryfront-linux-x64"
      sha256 "3c61320add70ac117abf37bb4cdd030493073639d528f8264c8a74e9d83b3ea9"
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
