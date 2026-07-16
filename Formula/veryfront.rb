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
  version "0.1.1076"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1076/veryfront-macos-arm64"
      sha256 "54a988aae59c92be9b4a5496746a0492f0b701f677f52f1f4075534870083f8f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1076/veryfront-macos-x64"
      sha256 "5d9b7321d0de77bb9611d1bcfc809417577aea5e7c24f896a3dc4b6da944c360"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1076/veryfront-linux-arm64"
      sha256 "c48aa6507a13b350ab2b3e4be2d14bfd40cd3d3c06ee6fd6d4c0902e3355d083"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1076/veryfront-linux-x64"
      sha256 "c507c67cb53876c994a385caed64fadd7d61a5f4e985290d285bd951c89086b4"
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
