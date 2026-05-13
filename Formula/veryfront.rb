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
  version "0.1.509"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.509/veryfront-macos-arm64"
      sha256 "39f0a0fff75120e466b58cbf175c97f70b545bc661b269763b9c6ef9decc42fc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.509/veryfront-macos-x64"
      sha256 "7b9ee0ebb3480e159a45f779e6706f472c458d08bd05112456590e39abefb4d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.509/veryfront-linux-arm64"
      sha256 "650ae996789b7ac01f4667617acf68f8145f811f1eedbf3abcdc2fa3d6264177"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.509/veryfront-linux-x64"
      sha256 "64ae9848eb008d7187cf9a20faeff46ac736b38e58c7182eaf6012746a764605"
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
