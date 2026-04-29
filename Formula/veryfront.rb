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
  version "0.1.318"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.318/veryfront-macos-arm64"
      sha256 "7eb7c17d6c9b24672a31d5bac3b29f3b6a443b10cd4232de7f6a8b63909e4889"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.318/veryfront-macos-x64"
      sha256 "689d939e58abc29ed801afe27a3d23c78b611d4c7e7811e100bbb4403782b313"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.318/veryfront-linux-arm64"
      sha256 "afd1c70fe8b58b44bdc4618a15e0f2d265dbe113eca93ed9c70557adc658a9e3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.318/veryfront-linux-x64"
      sha256 "8f4f65415e3d87337ce7e8b84653991e9bdfd55132f4592d1ec878da3e8f3f07"
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
