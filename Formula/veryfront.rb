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
  version "0.1.1271"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1271/veryfront-macos-arm64"
      sha256 "360a4ec3872ca791a3f7a8c74e334c2d6e1ecb3449d7456624cd1a26fabae28a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1271/veryfront-macos-x64"
      sha256 "2526237bc0898729e35f2c15a0ad73cffc25780b5d1debf61a269b51ba3caaee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1271/veryfront-linux-arm64"
      sha256 "889ece5b0e0fb4f8907da315694542c9e6b0d6b7f9a5fd01e1f9d9ff744d16dc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1271/veryfront-linux-x64"
      sha256 "94ae235ef50afbea0e82f1718b5b5b68591eb2d94f4c593895d340051db21576"
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
