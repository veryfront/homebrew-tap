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
  version "0.1.1049"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1049/veryfront-macos-arm64"
      sha256 "0d49f130cc1ce9e8ac02d8a319178aa39e1901c7d9c0592019764fbdcdce4032"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1049/veryfront-macos-x64"
      sha256 "97b2bab8f84858c901021c2d53d028ae369e61d8875b20e3e97e9b2b18a4ca77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1049/veryfront-linux-arm64"
      sha256 "75bac03eafd58377d495a8c4dc50360b2eb55cc4c4ef2de045e902b5feda3941"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1049/veryfront-linux-x64"
      sha256 "d6e228bb7c16c25e80f17affbf01b3089c4ddc515b7592f863f332e9ebe2833b"
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
