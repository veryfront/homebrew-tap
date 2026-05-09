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
  version "0.1.444"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.444/veryfront-macos-arm64"
      sha256 "fe94d9ab37491fcbcc450e8ae7b9e4dc0a02a46a0ec1b9d6758e1297ccf169c6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.444/veryfront-macos-x64"
      sha256 "2623128faa879bd857e7d8314f78179fdef0cd58fc4e347015a47222c0c2a30e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.444/veryfront-linux-arm64"
      sha256 "e4ba92ec58394ee7dcc5eeecb5f85450094cceab42866fb1d5e1f98941e27305"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.444/veryfront-linux-x64"
      sha256 "0d5cc2f67da4dbca0f757c894ab5c14dbe5e9cc66b8d3f03cbffc8e8097ec911"
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
