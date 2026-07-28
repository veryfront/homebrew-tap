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
  version "0.1.1169"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1169/veryfront-macos-arm64"
      sha256 "408f8a7ab393dd9ba895c8f0246e24e167b97e2ea1d29d35c07ab55c6f3683b3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1169/veryfront-macos-x64"
      sha256 "2d3c53929429956fc4e2899eaa8fd30114ae58d1e66a6a5aa5ec89eb1f78699d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1169/veryfront-linux-arm64"
      sha256 "9083a3d25f543a3da2d961d4028f67a9ee09ea952e16088204274fd16087e3e7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1169/veryfront-linux-x64"
      sha256 "5d9023822be5f562b8848e5c50ceb585db9aede355698c297557cbc9e2f3606c"
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
