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
  version "0.1.1036"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1036/veryfront-macos-arm64"
      sha256 "59008af6a6a1d7076531ed46cb5e51bb4257b24a065337ab76dc492a81c43d10"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1036/veryfront-macos-x64"
      sha256 "4c25011f76aebab122408f1cb7eef936f72465e0122fdc0c3745ec75ad9168a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1036/veryfront-linux-arm64"
      sha256 "e9c11483250f3dd39234b1788ec82fdf2a912e2e1d5943ea440d0175c19e3ffb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1036/veryfront-linux-x64"
      sha256 "58d371e2a0fc538022ff9c0cd4add823ff57b0d1bd39bc628136e3c454ba1d6f"
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
