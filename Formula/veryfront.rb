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
  version "0.1.1087"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1087/veryfront-macos-arm64"
      sha256 "e87a857eee4f20aa861dc2a1b0ee0c8a64147d2819c319a82c7886e2811bcd36"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1087/veryfront-macos-x64"
      sha256 "db90f9454fc04b8c1308bdd80153527d861fd505a3dca211e5cae0d05ad1872f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1087/veryfront-linux-arm64"
      sha256 "88de7dde1ef1453cfb36c05d3e059307a31b0786c5bb2ea7b195acb221d26624"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1087/veryfront-linux-x64"
      sha256 "f7a0691b58c204b6f2f00819b89ce4bb00754fdc8e3dea846ec1f39f693bd657"
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
