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
  version "0.1.143"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.143/veryfront-macos-arm64"
      sha256 "c45d3dc582e1d0ab6d9e421974022d770a60b5da8073214df9aebcadc0092507"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.143/veryfront-macos-x64"
      sha256 "74731d43cf14eec622fd192495194433809287fd836845bf51babe290d78bb12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.143/veryfront-linux-arm64"
      sha256 "87ae563909379798735d3c69779780c1761ebe74ff172aea51ce6cff641505f7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.143/veryfront-linux-x64"
      sha256 "c2db4f5cc955d24fe669078d788d8bdc8b78326b2000a2521a9ae2287a34c524"
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
