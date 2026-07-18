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
  version "0.1.1084"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1084/veryfront-macos-arm64"
      sha256 "41bddded2e98b6e84207445080b86222817fac6f475f7ef138af36621f8c991d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1084/veryfront-macos-x64"
      sha256 "f358d9651b105625c4ffc133f848dcfa05ba7b812cec9598dcc0a9258087a769"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1084/veryfront-linux-arm64"
      sha256 "0d932ae769b0978d183fd8b3206e11cc2fc3832989a570f0b4b70e40e347e09d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1084/veryfront-linux-x64"
      sha256 "eb4342586a77d4f8032b4d6392088a9eec3c58d77d39d74619469a277abfb84d"
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
