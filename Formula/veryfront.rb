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
  version "0.1.240"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.240/veryfront-macos-arm64"
      sha256 "7fcab6f8cff85abd7dd48c82d53bbc67f0055870ae5a92836831549c5b3a6035"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.240/veryfront-macos-x64"
      sha256 "5fe92b0fb74c7074d85cafe855d6c42e49b06ef646d617ec16d3a19df94ad8ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.240/veryfront-linux-arm64"
      sha256 "ce0dc22e39075922ba2e85a2274cfdcd16d084e4aaab4042255fbe21815bf4de"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.240/veryfront-linux-x64"
      sha256 "d09ddf5f23a805fd5400b5714b86c28c06303341736570cb9432bd17d7eb31a7"
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
