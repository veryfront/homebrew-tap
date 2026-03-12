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
  version "0.1.59"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.59/veryfront-macos-arm64"
      sha256 "7becf955589f411d7b2c15c3efe8451ebcf897dc44540d3b320c595aaafa748d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.59/veryfront-macos-x64"
      sha256 "39b1bc27a73b9d004b2fb821727401dba5af454169cfa11f183c67c53cc84275"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.59/veryfront-linux-arm64"
      sha256 "08fda7c580f28473fcea30c825187ae0118a70658c56cab066c3b7e50c6a052e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.59/veryfront-linux-x64"
      sha256 "1e00154e50360785c4289d70556987bdeae349fd7af914a27f7af048ae6a8c07"
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
