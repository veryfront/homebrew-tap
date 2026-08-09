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
  version "0.1.1221"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1221/veryfront-macos-arm64"
      sha256 "dddb1741913bc4c92d69748c320ca0127658bd715070f5fd252f47b53e21a57a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1221/veryfront-macos-x64"
      sha256 "b6bcf2662c4b9bb0d63490606ff6fc6840f4eabe3d3849ce949f5e3905ee0c74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1221/veryfront-linux-arm64"
      sha256 "323f7a85812bc5070b6eb4c750d2459d8fb9870d1208ed64b13c36d2ffe4d879"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1221/veryfront-linux-x64"
      sha256 "0dd9c2aacbd176786074d6416089fe4a7b6e940d56ba9949cadea8e6d2feb4a5"
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
