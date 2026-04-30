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
  version "0.1.330"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.330/veryfront-macos-arm64"
      sha256 "aad8ed1b24a1bdebbf619528d069296d66d9e78793e7546c53ece3e89086caa6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.330/veryfront-macos-x64"
      sha256 "a2880ede1dffab01aab376d9ca170651b3669668fc87ab24b31270b1b529092d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.330/veryfront-linux-arm64"
      sha256 "b8091b6eda88b968b3734cd463917eed4561cb70050ca2196e6280688ae9198c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.330/veryfront-linux-x64"
      sha256 "2d711b7ce9f1058e9c8f19fc0e86d2852b31a2705815c95d2c2e2635fb6ea032"
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
