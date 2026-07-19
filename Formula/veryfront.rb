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
  version "0.1.1089"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1089/veryfront-macos-arm64"
      sha256 "3fb37ddf1a5589890c503aa7d22f28007a209621754a3a1218586ab112015b33"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1089/veryfront-macos-x64"
      sha256 "e55125542395faeb1161d85fdbed487834dad3cfb01cc5057dc53402cd4d983a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1089/veryfront-linux-arm64"
      sha256 "b214e4b4b2793f9a9d9a047e26970cf817c9351ed21cc4b5ae635d0b4394c84f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1089/veryfront-linux-x64"
      sha256 "7795391f3678221fb59f6e3d128f13abdbb437ac7b065e9e8ea27f9fca9e9cc0"
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
