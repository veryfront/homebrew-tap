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
  version "0.1.217"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.217/veryfront-macos-arm64"
      sha256 "3b9cc21ffb4419a5c5f076809bff7122b01e5c9e98195ed26221ea20030d4d02"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.217/veryfront-macos-x64"
      sha256 "196fc2f0a1af68739a0cc14f27be483f377baec47d7e6358115ecba84f1c598e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.217/veryfront-linux-arm64"
      sha256 "4645abf41bf454ad585667880531b0608d103d2ede78a54cf3df37e4d655ced7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.217/veryfront-linux-x64"
      sha256 "f17cb083095fa1c98e97d2d6d4d5173ab6386f42077fb8e84fa4b5df62593a5b"
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
