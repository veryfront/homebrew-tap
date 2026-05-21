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
  version "0.1.568"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.568/veryfront-macos-arm64"
      sha256 "601e234ec3faed1e337cb113507d4877e146d310d767edcec4eaf9c564455c72"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.568/veryfront-macos-x64"
      sha256 "67537bd8f6d123d2d7dd33635841fd7f6b9fcf632b31030ef0fa1615c2615fdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.568/veryfront-linux-arm64"
      sha256 "3a894be59fb2203beffd09b205bf3cbaba99ffa0a8ac478899eff74202256413"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.568/veryfront-linux-x64"
      sha256 "fea76716423dc0fd0594394de3f4e255122a2a486a88ef5bb06ccfe544b66aaa"
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
