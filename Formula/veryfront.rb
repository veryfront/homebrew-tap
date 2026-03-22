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
  version "0.1.89"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.89/veryfront-macos-arm64"
      sha256 "8bd90a67fbeb1867c4b4d75abaa6de98398eb23fac5ec19099e95a2fca7ff59a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.89/veryfront-macos-x64"
      sha256 "13dceee95ac632624229a62a4c64e65c99c9b6740d6604d9a6fdfba7ef5b73c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.89/veryfront-linux-arm64"
      sha256 "57a97f54319e58564d1490389a52cdfb68d33216c2d7f0399550cce8221bb220"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.89/veryfront-linux-x64"
      sha256 "93130909a4519d8b4329649a794ce541a7d91f2230e43bc7b0880d00415f04a3"
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
