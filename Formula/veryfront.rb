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
  version "0.1.570"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.570/veryfront-macos-arm64"
      sha256 "75c726c8ee0abb436e1485fcf8efc78becae95cdaac3618c6b74fc169c7a0984"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.570/veryfront-macos-x64"
      sha256 "faefd9ef7e5e7542bc16d2ab1915ab7a6b677c391c0aa128d3b1d63d686797ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.570/veryfront-linux-arm64"
      sha256 "36ab3821d7c8af49e171501ff7060403c47774558b4227320ac99b936a9dd336"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.570/veryfront-linux-x64"
      sha256 "ddc18f29c8d31eb6434d97172496e1501adb3f53217261b867f47daa09924261"
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
