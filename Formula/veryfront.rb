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
  version "0.1.489"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.489/veryfront-macos-arm64"
      sha256 "f1a658bd4f862b73db5873c20afd6dee45e4840d99fdcbec72b3d1fc25fd60a7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.489/veryfront-macos-x64"
      sha256 "487638f53e866f8963c677a4b47c6646a00b5eda8659045879d6f97a6c4ff5ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.489/veryfront-linux-arm64"
      sha256 "3a21d00c2f2b5f81dc40a8894faa582df3c3b64c1dba15aa9a82abd7c0059135"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.489/veryfront-linux-x64"
      sha256 "f1ddffb19e546d7f3a207400f135c50603f84ee2ac04277e9106118ab161a00a"
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
