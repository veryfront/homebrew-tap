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
  version "0.1.282"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.282/veryfront-macos-arm64"
      sha256 "3133544861f1bed59a22fbd4a884777a0668dc7cfb568b21d54762e43cd82765"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.282/veryfront-macos-x64"
      sha256 "15af241f97812c649b3cb7ef5bd64547375e394d036c0b7625f0a543a283d2c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.282/veryfront-linux-arm64"
      sha256 "5bde5694416f980b33d3cbdb101a35b49d5ad65facf11f52b3ec92853d409ced"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.282/veryfront-linux-x64"
      sha256 "6263a4363260704dea94472ff50427406277c958f7a9eadb337c7d49efafb13d"
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
