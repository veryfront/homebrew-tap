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
  version "0.1.261"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.261/veryfront-macos-arm64"
      sha256 "e6ba123c87b0bab47705a5209ce67941447ce8630dafed4260b122bf50cda38c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.261/veryfront-macos-x64"
      sha256 "25dbb7b45ea73f87126e16d537afdebb40349355633a8a5dedf1ac652fd49868"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.261/veryfront-linux-arm64"
      sha256 "cee2b71205517c07a2ce52830110a36ffe863f6ca305767e886f58bad3f4b303"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.261/veryfront-linux-x64"
      sha256 "803ceaa5a5108034874fc48dd3a0006b731373ebd04bf6e9a297aab986c873a9"
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
