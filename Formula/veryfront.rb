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
  version "0.1.1275"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1275/veryfront-macos-arm64"
      sha256 "fe7ef06222e4011a7e9d21515641ce35952884fcadabe9cd36358d742a4b9885"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1275/veryfront-macos-x64"
      sha256 "1e4b9efd4b580c1a1d17a68009027ef99d0f79efb4675f07633015464e4393dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1275/veryfront-linux-arm64"
      sha256 "8f37e5b5b93af0b511ec1b89f239c4097a7e78d665dea34318de60d7d23242c4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1275/veryfront-linux-x64"
      sha256 "d2e7cb0662d2223e83390665498efff3a6cfcf9ef841fe70e9a6199ceb6f1d8d"
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
