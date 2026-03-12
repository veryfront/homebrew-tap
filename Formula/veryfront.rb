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
  version "0.1.62"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.62/veryfront-macos-arm64"
      sha256 "11995a1ce7033c11887c149285b1e874cb1a91f3e19783f500a34248e3228aad"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.62/veryfront-macos-x64"
      sha256 "90421dfdd671e4805e53b5da605cad2d04331834dcec7cd134a74909f989ace1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.62/veryfront-linux-arm64"
      sha256 "8cb572838f43a8e51677a1ff35cd3bc6dd146bd2b76b4854c9c9b86dad739964"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.62/veryfront-linux-x64"
      sha256 "dad071a09bfe5a2b953987d8e0f0bd2ec0049d91b85b10800daee2fcf94e765b"
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
