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
  version "0.1.107"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.107/veryfront-macos-arm64"
      sha256 "1409be0f5e4fceabb2691d66a9c4ba51939fe02b4b86944552c4fb34d35f0bac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.107/veryfront-macos-x64"
      sha256 "1b0615d4eb47406588e82b12c300ecb6bdec73fb2bb014155f8608249048856e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.107/veryfront-linux-arm64"
      sha256 "426714cff8d4180a23b78f763eeccd58f914a8bfa05fb3a831a22163e323d7d1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.107/veryfront-linux-x64"
      sha256 "5360936405eea4ec982271ec60b7abc842150e3cd9147b06111da6f2bd66cb7e"
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
