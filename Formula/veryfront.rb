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
  version "0.1.82"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.82/veryfront-macos-arm64"
      sha256 "8c04f6dd2b70688745267caac7f014113c45afddd5297c8e5e61ea43bcf38c30"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.82/veryfront-macos-x64"
      sha256 "5c7f51c9f5c4300490d0b9a777ed66d4b39501d575d2a7113b86f9780b34d244"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.82/veryfront-linux-arm64"
      sha256 "508b4d697b518541fd9b31742ae7ac0e73c0f07548d3c76d0de04daece4ac08a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.82/veryfront-linux-x64"
      sha256 "174261018a1a7e78db6cb589e0139bf4bfd7b42cce93e600b78b3a48447392be"
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
