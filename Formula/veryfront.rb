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
  version "0.1.983"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.983/veryfront-macos-arm64"
      sha256 "55a8f3673a34d63c00554da118df2fa1687b4e345e751764c255491b06114faf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.983/veryfront-macos-x64"
      sha256 "7c8f6670094c8cbbcf8fcdb2c3950c63a7d3b7830ba6c688157c2baf481022e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.983/veryfront-linux-arm64"
      sha256 "af95f320b11dcdb62d7d76eadd72a30f50faabf116ec2aabdb64dc3bf4b6316e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.983/veryfront-linux-x64"
      sha256 "bd3bd534139113a4a4c1dab579ac0adf8abb889deb82c4d6bb31e35fa13b9d78"
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
