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
  version "0.1.646"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.646/veryfront-macos-arm64"
      sha256 "6eaec2396efc3054e0391c66c9569ac224d80c933227cdfb4241c67699ddd0da"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.646/veryfront-macos-x64"
      sha256 "2f9dc3fed61028d415c6f70f87d61525b79d8ca78e614727104b613986cf8819"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.646/veryfront-linux-arm64"
      sha256 "4c03f74926160ec89ab22453536ae09b36e9a777f959b72ac86045126da7ce3e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.646/veryfront-linux-x64"
      sha256 "5708eda803c7d43fc802201d3e7376fb0fa6a10e37fda4f7b75ecd7b3bf3ed9d"
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
