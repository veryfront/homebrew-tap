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
  version "0.1.1067"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1067/veryfront-macos-arm64"
      sha256 "7c3aff5b4b0d74f9a4f24a75c8ee9c09aa0689a59f88e637ca16dbe558281e4a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1067/veryfront-macos-x64"
      sha256 "9c29fd2097672f04f44fb0c403df18df2c228adda558d0bcd2fca3094c529a38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1067/veryfront-linux-arm64"
      sha256 "f4e35221b6c5da4b70b259150cab2035547781a3063d02f614362954b3969868"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1067/veryfront-linux-x64"
      sha256 "305df3b47d909c9712aa70d668d759a547601abc483a5d6dcf258e6e81b7687b"
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
