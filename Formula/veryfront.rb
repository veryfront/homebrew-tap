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
  version "0.1.356"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.356/veryfront-macos-arm64"
      sha256 "e23693a067c89e0b82f852e2c976fad361aa511ec17fc979b17672797414d6a5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.356/veryfront-macos-x64"
      sha256 "087e69b669570ed6af95bc354f62809fc941b1cb035f5bf287483b3e8aa28123"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.356/veryfront-linux-arm64"
      sha256 "939432f7e62b03b5896c54d4dea4146fc70baa65257d8f9641ed657308a64cee"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.356/veryfront-linux-x64"
      sha256 "a32b97b534e7e3b7fd8e1567ecab479123873afbf9f5f5b39c0f6a9d9fc0fa32"
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
