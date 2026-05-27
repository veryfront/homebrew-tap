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
  version "0.1.594"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.594/veryfront-macos-arm64"
      sha256 "73543eae5b6899c7b9fcdaa69f5406f50b9701f9c1e3ae164e41a25a4c86e9a0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.594/veryfront-macos-x64"
      sha256 "3d9798e449abda473f1a989ce6268914804bc44cdd01c5316385b7fa723185dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.594/veryfront-linux-arm64"
      sha256 "0057a5e23797be7a8d8528415251f99e6208a3c6e6045407f9935592791905d5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.594/veryfront-linux-x64"
      sha256 "1ca9dd97a7652ad8ed5ad1d31f4a09c03f4573e7738ba7b17e8462ab438a3866"
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
