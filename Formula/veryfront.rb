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
  version "0.1.442"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.442/veryfront-macos-arm64"
      sha256 "9585233ceaf4d145400f33beae773b8c4a18fb3d60f44222a31c8bb606e95a8c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.442/veryfront-macos-x64"
      sha256 "012fdf32b41380fbf9c908d4544ca36f718eeaa9613922a5faa31fb80b961bc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.442/veryfront-linux-arm64"
      sha256 "dfb235712a0fb8aabfe56d430f64a38c5c7d3915df5bcc7c30e3faf523ca01c5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.442/veryfront-linux-x64"
      sha256 "1cfa65386b88fea131b14a5ed8cf4cee12df8172ce1ca75787bf2d66a8ea5cec"
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
