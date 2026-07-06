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
  version "0.1.1018"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1018/veryfront-macos-arm64"
      sha256 "e2b7d4aa1416b80bf7cdfd566fee011071d3d1281221f102e4359248ee9f1e21"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1018/veryfront-macos-x64"
      sha256 "010d5b25f6b91b04ea628ddffe2b37980d1e6cc5e103b05d38c7194763bd9fa3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1018/veryfront-linux-arm64"
      sha256 "aa7c8f73331143adc4c745a04a11d0957dcdc41f2b1e1b9c365ce6074286df56"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1018/veryfront-linux-x64"
      sha256 "f2885886469ed8fb305edd752cc4e1dc8040d19afe2ed83b53137dc5d2ddc387"
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
