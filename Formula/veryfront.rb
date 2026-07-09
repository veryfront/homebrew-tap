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
  version "0.1.1037"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1037/veryfront-macos-arm64"
      sha256 "cb0ebddc0660c6eca7543e925de8ecb53122227c3393096e70f097ae54b4f3af"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1037/veryfront-macos-x64"
      sha256 "0f9da4b3627a1c985e53aa0ded72d94b8971680251de9d083f16e8dfdfcec024"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1037/veryfront-linux-arm64"
      sha256 "77eeb8525499d9a67ff102f0f689ccec6a1693094006f0e19e5dac9c1c6f9ada"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1037/veryfront-linux-x64"
      sha256 "e9e5c7a44cb4cfb6985956fda14115088dd84473a568e73edad82988bd77ad44"
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
