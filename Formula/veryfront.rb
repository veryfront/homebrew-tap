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
  version "0.1.578"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.578/veryfront-macos-arm64"
      sha256 "f8b185761bca4fc204467a8ccb4bc20c46b9e90fc510945009d64a0cfdd9f87b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.578/veryfront-macos-x64"
      sha256 "a6fabfc9b904688046db34a9c65401a7a0a31ed2c9819423817f01b236629b02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.578/veryfront-linux-arm64"
      sha256 "51ab7b7ea1728225f3e8dfc121bfb9346a88e81eda202fd725a1b73ff51cab8d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.578/veryfront-linux-x64"
      sha256 "311ee85f9013e5b86c7483b266537f1a0b644b818cb67515d055d67601588799"
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
