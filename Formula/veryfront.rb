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
  version "0.1.924"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.924/veryfront-macos-arm64"
      sha256 "9455a6b893a172d3df92f60f91667b467148c6d9b930bfe5819d3f3c6c3cc6a9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.924/veryfront-macos-x64"
      sha256 "3f001cd8d2f309ad0ef273fcec411fd1fcb081e52ecfff483748ecba6df85049"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.924/veryfront-linux-arm64"
      sha256 "86b613c283ccf5353ee3c7eda03028c19c2a3dd4f13a83f5d3779e5ac094c6ac"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.924/veryfront-linux-x64"
      sha256 "712d45993e4975c518550dbfbd7e3751a8528f4f5f27067eb63024ef20850888"
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
