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
  version "0.1.659"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.659/veryfront-macos-arm64"
      sha256 "14b00e0e17b94678da3f4f84592a93b81116b5349a2b55d64cab0b3b75af9c2d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.659/veryfront-macos-x64"
      sha256 "8d28f096488cfeae6f6967f43ecb076b442620a39b701dd3e1d18f41d0e90028"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.659/veryfront-linux-arm64"
      sha256 "df58a3f24138b124d8458ad1cc81906e4d9a697c7405dd8eb6d0785e3d6a821c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.659/veryfront-linux-x64"
      sha256 "79a1d5b888de4de4d1d9ac4dcfcf4bdc52e50ae452fe4c5f9d90131d68f36428"
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
