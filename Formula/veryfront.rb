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
  version "0.0.84"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.84/veryfront-macos-arm64"
      sha256 "ecc2be7d6f2a0e02ad742c2cb0dd0a981563708e8104415834f54bc705afa3fa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.84/veryfront-macos-x64"
      sha256 "b7a05856bb0f4c432b6ce9472cf8049264db201573ff0e0e9f88823a779f36c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.84/veryfront-linux-arm64"
      sha256 "b9c6b50d50d03b81e32bfd3499dd725684dd91e98eabaee4fd97a241b7535c10"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.84/veryfront-linux-x64"
      sha256 "05697e3a8108fc15f141a741ea523f6fc65dacb26a9df33b38530ce82d1eaa3f"
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
