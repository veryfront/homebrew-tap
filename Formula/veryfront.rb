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
  version "0.1.399"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.399/veryfront-macos-arm64"
      sha256 "bcabe8b0d1c42907927600acf9faf4b767c1486a58513858a3dbf813984de33f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.399/veryfront-macos-x64"
      sha256 "f0abf85c1dca771569906fac44ff737de58d7968f58f70ef8ef9d5392416c53e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.399/veryfront-linux-arm64"
      sha256 "f726db7766e2f24f9fe9d75ad72404c7ad398bb0225eb0492045cc1c20ecedd4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.399/veryfront-linux-x64"
      sha256 "98da1dd527173494ed708585ba048776e66eda4623530df0665200718db7b687"
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
