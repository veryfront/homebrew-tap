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
  version "0.1.504"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.504/veryfront-macos-arm64"
      sha256 "ba3d269fe4b6ec2c27d0a1c3a054225f7ad98b87d5922cf43c7965bdd18ea65f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.504/veryfront-macos-x64"
      sha256 "811b508b0b12145cda41d238ceebc5143a8eb976b24021e4bdaf21afc59d3094"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.504/veryfront-linux-arm64"
      sha256 "7914745edb3c189a63a54690942a5d2fbfd8246931400b7b39d87aeb738598a5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.504/veryfront-linux-x64"
      sha256 "cc39e04e84dc40cc9f86d0f0f062003565a0fa5732aa3190058132fecd519001"
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
