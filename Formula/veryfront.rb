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
  version "0.1.331"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.331/veryfront-macos-arm64"
      sha256 "7bafc6a205434ed9b97c982bad9e9a7accd0e0622104986c9020df810e318840"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.331/veryfront-macos-x64"
      sha256 "e2569eacefc4532ac5859fd3c6aa7bdd81769106e45dbaa780819d6350a39798"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.331/veryfront-linux-arm64"
      sha256 "46cf4583738d8007b612a11ed496c24b74c196eaee613833d7b9331c8d4510d6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.331/veryfront-linux-x64"
      sha256 "a64f94b961028538797d4c2ddc39d4e32ece075d7b5142c64794701b66b7af89"
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
