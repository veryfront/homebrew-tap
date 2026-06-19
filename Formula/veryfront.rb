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
  version "0.1.863"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.863/veryfront-macos-arm64"
      sha256 "8a542b8f8d6633ccf5284c6f7fdc7a154fa5dde41aedfcf2bef95c45b08f7859"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.863/veryfront-macos-x64"
      sha256 "f537ea9bdde39abb9e624a168519350c04ce2d9413302a7d879ca101332f65b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.863/veryfront-linux-arm64"
      sha256 "7e74fe1a2ce3e540dbaf071ca7215d5ea195ee3f026e0f524a02d4f02f656572"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.863/veryfront-linux-x64"
      sha256 "be4a9543981272b1da3d727836adb4ff2ee803e0cce0873e34cb8d3b35a2f281"
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
