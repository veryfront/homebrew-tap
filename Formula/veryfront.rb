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
  version "0.1.1159"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1159/veryfront-macos-arm64"
      sha256 "1407431f1d1dc373dd5d6301aeaa7b0dc5a373731d5507d9986ab2465c339e3e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1159/veryfront-macos-x64"
      sha256 "030812574cf16af8797854d97728ac2da9b6e3bb57df42cdf41731ed8049e38a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1159/veryfront-linux-arm64"
      sha256 "8fb6cf346d584bd45ff28b7ee00cef2fa09370a263d4c6b6f334b05ef5457bf9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1159/veryfront-linux-x64"
      sha256 "b7f79af59ea066e44ddc5340a9ac41d9d053f4712279d0e9077056b3e71fa5cb"
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
