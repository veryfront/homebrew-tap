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
  version "0.1.854"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.854/veryfront-macos-arm64"
      sha256 "a520c1e6b334d02d2e5bb7c43ca82bc96901ece55a7793e16744e3274f3d8e79"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.854/veryfront-macos-x64"
      sha256 "115d7ca2efa4cfbd6bf47531186120b93399ef114122b39c75104e1b9d07fb0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.854/veryfront-linux-arm64"
      sha256 "586de911ae2cb7e1735036698df95f1843d04acb51cd94d615aa93df3c4d20b2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.854/veryfront-linux-x64"
      sha256 "db311e2bfc2bdc4f2f9704adebc725f062eaf1b4940144b6c33f66de6e43fdd1"
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
