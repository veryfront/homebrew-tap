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
  version "0.1.763"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.763/veryfront-macos-arm64"
      sha256 "c2cdaf0378e5fc7b5ac2129f1c7c201d590c2fe11be89dfc98593860081fbf1b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.763/veryfront-macos-x64"
      sha256 "13bbcb489889be0896f9d08a7b5ebd8d427a3838fdeb090e33ae930f006f6485"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.763/veryfront-linux-arm64"
      sha256 "627173a70586638384beb8b9da2dd21c787cb1d5bfddd697d774dff7c73f0f93"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.763/veryfront-linux-x64"
      sha256 "3e73c416345130f6ec81c3a96f86053fe4f44d76a4a35238455f2d6876b3c727"
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
