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
  version "0.1.670"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.670/veryfront-macos-arm64"
      sha256 "934851c5c3e99a9aed5cd7698382d9e3ca9ff344f911e9c5b58be549b7bb2f83"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.670/veryfront-macos-x64"
      sha256 "9601a37efd5d07c664f830ba87940a7e5bcaee98cf8ae8078fea1405f23eef05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.670/veryfront-linux-arm64"
      sha256 "f72d50ce116b798eff24421455fe4cc765ee76feda1fe48ed92b3c58f0a8d00d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.670/veryfront-linux-x64"
      sha256 "d2d6bf8d80fc8083b07d7f85f583e4329083e92b869f73005e87933b2db2438b"
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
