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
  version "0.1.658"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.658/veryfront-macos-arm64"
      sha256 "c332399509baa58d75a2f6c6542056d019daab92667fb1fcf317c492a5699e5a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.658/veryfront-macos-x64"
      sha256 "8466fcde106818bff82fa01ffd1cb82c2dd630e010918fc4e0697a91de0b5d51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.658/veryfront-linux-arm64"
      sha256 "0d49f968302cb650d8075f211e9acd5d11a5d19c471ad81d170b21e1f9679468"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.658/veryfront-linux-x64"
      sha256 "291c9bf252a39bfe5ba19150843a23c802918308813568751cb26116edc849e2"
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
