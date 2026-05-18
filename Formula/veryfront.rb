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
  version "0.1.552"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.552/veryfront-macos-arm64"
      sha256 "fcecb27bc86c43fc1fd083bacad9b9badad64c94fbbf45c7f90878231f97ac6d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.552/veryfront-macos-x64"
      sha256 "77cc588e4d626f5108c59ff87ebbdb91259f5780697acf1e151c863e6d8ad254"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.552/veryfront-linux-arm64"
      sha256 "5e11c63e1a93feddd6ce068d2a49a798a63cf1c9f8e2664398682464ca2bec12"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.552/veryfront-linux-x64"
      sha256 "1aac9959d0183816437911f180bd53dfd258501dec4d90e416693299cf6e3e09"
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
