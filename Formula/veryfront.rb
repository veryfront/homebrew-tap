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
  version "0.1.334"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.334/veryfront-macos-arm64"
      sha256 "b7ab2c51ecf6a2af284a0a549b13642ad471d2e7b5e38aca71b43a09d9197eaf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.334/veryfront-macos-x64"
      sha256 "9b4ba7666626aac4081287adc10c5d8e864f44e4b01943d25e06c11e61ee7a10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.334/veryfront-linux-arm64"
      sha256 "1a51b0bb16840c998aff81a82b6442f3a2a732bc47bb1bf562e31a4603f278f8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.334/veryfront-linux-x64"
      sha256 "44ab189151a3753f7aa4d91145757a05a495fcebef89af08ae068d586f9fa0fb"
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
