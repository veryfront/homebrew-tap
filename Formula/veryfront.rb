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
  version "0.1.49"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.49/veryfront-macos-arm64"
      sha256 "77548226049a50b7ab0930c1fcb7b46ff5b77b244f399fd7a43e9d4731fc1455"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.49/veryfront-macos-x64"
      sha256 "f92934934f0c67bdd3304c636411f9cfa32f374f45a4aa554e7904bd1e398f7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.49/veryfront-linux-arm64"
      sha256 "854c17a4fc5e3bb8b541e6f41dcc273244eb4adb62841c768dc4e7bdb75fa826"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.49/veryfront-linux-x64"
      sha256 "c8365f415039a8c4c76bd8c807d9c2b9dfb25095bb7e96b83cac052ca53f36bf"
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
