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
  version "0.1.246"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.246/veryfront-macos-arm64"
      sha256 "9f53dec007367206cd9ebf7b0da896251114451e533a449b77f3da45850b7030"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.246/veryfront-macos-x64"
      sha256 "ce526506257c089f1d30a57d41fcbda53785652df909376adf2c26ca4b21e44e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.246/veryfront-linux-arm64"
      sha256 "855ff3a02c69345ec0f7f2f2516ec13e23339d6116c4440fc08410512f22ca45"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.246/veryfront-linux-x64"
      sha256 "e8e7e0a13c3cf6eee5f2b62bd842de37f3f2653c5f23fee3963e4d4a505c4872"
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
