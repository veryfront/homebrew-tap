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
  version "0.1.1282"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1282/veryfront-macos-arm64"
      sha256 "6f181a5c8a25f2faeb74d903421fda1549763a361c7b7afdefdfff22a7888c15"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1282/veryfront-macos-x64"
      sha256 "6e56770af0a3abf1119a6b1e50de34c3a6261dff0e54064d2ac293b1727e2ec7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1282/veryfront-linux-arm64"
      sha256 "ef3877895aebf54d6074c403eb19fae0e6abb5434bfaf1a656addf31bf6df269"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1282/veryfront-linux-x64"
      sha256 "35fcf78c7aafd238481087f5a6956dcf88b76a80c6c05612cb243f5731ff6e7f"
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
