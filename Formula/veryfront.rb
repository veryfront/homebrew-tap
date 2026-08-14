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
  version "0.1.1237"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1237/veryfront-macos-arm64"
      sha256 "133b5c2a8c9bc06ef8f87b5c9f4ef4c2bb3240892920196e7408f21c1d76778b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1237/veryfront-macos-x64"
      sha256 "7ac7c75eb0e8087a82d9b158945731b3bc9c14158f4d02df4c21d909ef51a87a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1237/veryfront-linux-arm64"
      sha256 "dda561d437004fa8e5b17ed2d2e5f36cbbe8918afd668be6af03736b8c87db60"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1237/veryfront-linux-x64"
      sha256 "49333baab1469d0f0668b4a5cd0e9d53f7af355c78d7c0aa483eeb159fc42c51"
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
