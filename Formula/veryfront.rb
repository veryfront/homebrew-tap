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
  version "0.1.457"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.457/veryfront-macos-arm64"
      sha256 "b7d60be4ae7cc62871639dfb49170396d1fec0336fd9e5ca2f6f1b5bd2f1313f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.457/veryfront-macos-x64"
      sha256 "ce84d95a3804beb09a8fee072d0ab6e80cf455edc5f30acabc3b5bf80e40c025"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.457/veryfront-linux-arm64"
      sha256 "8b731507f88455f2e61b0da5cea97717e6d5b8bcdbe8047cd9f637b89d07749d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.457/veryfront-linux-x64"
      sha256 "372a45f749728933f349811e688071c7426c9a5ae0d63937fdd1b722e3f9835f"
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
