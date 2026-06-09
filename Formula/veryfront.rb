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
  version "0.1.710"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.710/veryfront-macos-arm64"
      sha256 "5ab0e257e085ba0874b10dc925a4a3874a825b805e59d9b74583ee6fd675a0b3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.710/veryfront-macos-x64"
      sha256 "73310c108ebe2dad589ce004c0b6fc8fad2ed9fe0807ab5c37b50eb8e05f6a79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.710/veryfront-linux-arm64"
      sha256 "bd49d297ad69bb0e9ccd24b0f50cdc7a8a0454f7291d5a7958e2c468ea3fa602"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.710/veryfront-linux-x64"
      sha256 "8d77aaaa0cec645eddae3a98be3e427dd978cf63ba225f704a30a3545688f46a"
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
