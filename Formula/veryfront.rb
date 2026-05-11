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
  version "0.1.481"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.481/veryfront-macos-arm64"
      sha256 "8e91f814657fd5aa819bd0275f421b810de313d74aaccf9148cfb00e65f092aa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.481/veryfront-macos-x64"
      sha256 "e7595590560482ec88ea765c85e4ded2cb588daac94905e6d1406ddb323b7baa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.481/veryfront-linux-arm64"
      sha256 "24565da89c4e9645e9f401aca6b4dccef8186ed38d8b3f76fb7d33af4beb938d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.481/veryfront-linux-x64"
      sha256 "05cca8f8d03611a11be322f67a6c90805e34dd7d5412bbb9c6e9fafd303d05cc"
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
