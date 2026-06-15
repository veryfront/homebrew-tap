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
  version "0.1.813"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.813/veryfront-macos-arm64"
      sha256 "f32a35dff4f57adc27e81e654d35f6bbd59d65aab4749a517bd03a6dedd3bb4d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.813/veryfront-macos-x64"
      sha256 "9446ed96ed35f54811a89e7d2ee37748953ffa75a75825234e15af5f59a9cf98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.813/veryfront-linux-arm64"
      sha256 "37dfea0916d43356fc12e9f98ea5a46b72443a223e39c0e0b774a4a2b84432ee"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.813/veryfront-linux-x64"
      sha256 "6396f74a61d578f22dc4eefa6050d867baf50430aaad1f4ef70b0c6e456fd880"
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
