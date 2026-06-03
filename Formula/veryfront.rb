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
  version "0.1.644"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.644/veryfront-macos-arm64"
      sha256 "f7747e57162e8b043223ee3cfb67fb69a391d315b3f84e1ad9d906522f159019"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.644/veryfront-macos-x64"
      sha256 "fc968cd4d5a5415adf43815282ce9dd3d2c6ddb01879b85b7bdb30be67d27ff6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.644/veryfront-linux-arm64"
      sha256 "daef47fdcb42cafb1d4f4268ce243f863c6224ddfd171df5fe244240db732c41"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.644/veryfront-linux-x64"
      sha256 "2bcec9d8b8bc480d0b249ce71254ceec44b53129e0f582064022b0a155cacb26"
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
