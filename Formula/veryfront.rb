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
  version "0.1.265"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.265/veryfront-macos-arm64"
      sha256 "59da1cfe931373212b5d89ff0a92344d031f0d22aaf36f44edb68d3202c447a7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.265/veryfront-macos-x64"
      sha256 "7f1e8aa5cde480a1779f891481d681a4f536f95f53f8a10504e96ee2257eb6e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.265/veryfront-linux-arm64"
      sha256 "21450f4127618e15ab87b5c69a4556b3fec32c4626fb9607dfa57a15f491d2bd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.265/veryfront-linux-x64"
      sha256 "9304abeb53c2b2495162265af8ef4d677d9b3f2a58a0744b50a978e5ee75f25e"
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
