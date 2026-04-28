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
  version "0.1.316"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.316/veryfront-macos-arm64"
      sha256 "caeb160b9138bb7b59b9c2faeac6b7e39192b0104165fb6aff577556583ea4e8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.316/veryfront-macos-x64"
      sha256 "20d4a0a09c763560d003632fdd2758875b75b06a9a44e614162520864ce1fb6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.316/veryfront-linux-arm64"
      sha256 "b823b288658087e165c2a6819e3d06296f87a157f99f36cff1bf0e1cabfbd713"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.316/veryfront-linux-x64"
      sha256 "e0ab5f59ba2bc247fcdf5715b630f538f8933576f0b824dfcb2771333c38df9c"
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
