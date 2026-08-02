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
  version "0.1.1186"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1186/veryfront-macos-arm64"
      sha256 "6b2009392f62176e375fc3f898e3730580fc73ac86d471ea6f832840f5dfd03c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1186/veryfront-macos-x64"
      sha256 "a8c07296b57c5366b7cd75d9cd25f91668559404cc8aa59d7a6cbe4b96a8c8de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1186/veryfront-linux-arm64"
      sha256 "2e2c4af2b01275c2e3bc17a29ad4ffe9fa6c36ae07b16328a4329455c79b9092"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1186/veryfront-linux-x64"
      sha256 "b249c803caa0b43c9a4f593e7b2f01b3bbe16c549605501359168eb341819aea"
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
