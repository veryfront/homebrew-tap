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
  version "0.1.652"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.652/veryfront-macos-arm64"
      sha256 "3517bb1d019f4007a0a8f45129601a0dc4abdb026c3208045722e1558b9954d5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.652/veryfront-macos-x64"
      sha256 "b8ad67b3c556bb9ac9b9afaaacc713c384e972a1c935e73e346b0d339294cc36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.652/veryfront-linux-arm64"
      sha256 "ab954d1301c7b23caa5b0817821dc19dd72a20081ffc3bcfe5495236fd469ae3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.652/veryfront-linux-x64"
      sha256 "9475c67def6773d638902b3b15f6e03be9d5c37df3ebe412069a5003f92d8c85"
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
