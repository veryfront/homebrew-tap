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
  version "0.1.1126"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1126/veryfront-macos-arm64"
      sha256 "00c7ab603d1216e491e71a2a25ed148f4dc295e04674d0eb112c9d40c35149b0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1126/veryfront-macos-x64"
      sha256 "f6817d2365c54034965a98d67bc9197f70eb614c969dfd891daa89b688562ddb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1126/veryfront-linux-arm64"
      sha256 "238d4698ee2ff89dbba76e0391985a7dddbd1422c11cd4d1ae545e0073443c04"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1126/veryfront-linux-x64"
      sha256 "e057cf0043c5ba3916eb8255453f9b4d6f9fbc516d64312f77a111bf36e248c9"
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
