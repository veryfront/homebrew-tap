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
  version "0.1.613"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.613/veryfront-macos-arm64"
      sha256 "c1d6db3554ffc4d54234faf3ca8e53753afd854a3894d9223a66bac5fbdbc55a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.613/veryfront-macos-x64"
      sha256 "268c4039c91edac83cef4240e3adf0460c08652da52839ca2d8b2c7d17f0b3a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.613/veryfront-linux-arm64"
      sha256 "2b8eb3332434cb7c08ec5a1f93e8ffe657a3badba2a64488fdf2bad054884d7e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.613/veryfront-linux-x64"
      sha256 "b88ed267aa0530ccbc78877425ebdbed2f37fb9957406ffe2ac6569ae8ad146b"
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
