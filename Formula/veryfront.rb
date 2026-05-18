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
  version "0.1.556"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.556/veryfront-macos-arm64"
      sha256 "424f065e9d67d3fbc3b504d7b047bc73c11f9098000f35ecc830fafd5b67c4a4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.556/veryfront-macos-x64"
      sha256 "126cf7abf027d2ffb6899eb4d4c9a3d94edc70622672e0465255afc5f56684ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.556/veryfront-linux-arm64"
      sha256 "442be1ddfc1b4313b220d4ec14c2937fa6b71bb8bbbb18c1f1082c6246a98d76"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.556/veryfront-linux-x64"
      sha256 "b44de67adb6f1cb7a0d43d9a4a583de786804c6620ffee7c1cabfd5b03c55e29"
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
