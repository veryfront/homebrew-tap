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
  version "0.1.575"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.575/veryfront-macos-arm64"
      sha256 "a5b5338ef3b53ee1ef75fe4e4a0192e88449ebae603f13351921a41c9e5c0dda"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.575/veryfront-macos-x64"
      sha256 "40417a77c39bb133af230d45bd96f7124c87b09b16701b89840497d4f031e934"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.575/veryfront-linux-arm64"
      sha256 "eda06082c94eab6699ecd14994ee638e9c33d9eaae3186192f18f333b4e44a52"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.575/veryfront-linux-x64"
      sha256 "7db779fcd403f96d066450a289d9a6291fdce3564980d2ad7d22842e64a92868"
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
