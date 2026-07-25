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
  version "0.1.1150"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1150/veryfront-macos-arm64"
      sha256 "848c1571becfaaddbed410df053cc43414211761ccae9fadbb197b3ec57fd5c2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1150/veryfront-macos-x64"
      sha256 "a3b9b9b6ce58d5d616be854237ff468fb70776dc51bc168e10fca630be7a0b27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1150/veryfront-linux-arm64"
      sha256 "77571ecdeac3494366bbd6091413953ed600f936200eba9fa3b71f889366d4c6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1150/veryfront-linux-x64"
      sha256 "9f61d750cee163ec7169f4ee8d366126efca398518600c7bee82e9c4c12eb269"
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
