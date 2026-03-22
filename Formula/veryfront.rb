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
  version "0.1.83"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.83/veryfront-macos-arm64"
      sha256 "d366adeaa6e9fee43c36bf4c84f5650a61da0ff07c8f15328296d059b15b4503"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.83/veryfront-macos-x64"
      sha256 "77e437342a49afff0f8ba6c37cc99d49d4ccb576d82dff37ec5a34a7b611db3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.83/veryfront-linux-arm64"
      sha256 "eb6f8eb3bb7a35005371a5443fa7f38101d87f31d2da7d6d962f2589dfcac524"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.83/veryfront-linux-x64"
      sha256 "407cd404f80fba67a466283936204d60ba96b5d9578a3e693b4a94fbbc7081d8"
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
