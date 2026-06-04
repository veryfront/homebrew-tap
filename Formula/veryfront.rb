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
  version "0.1.666"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.666/veryfront-macos-arm64"
      sha256 "d56709398b7181826762c6ba08405cfc4b5ab99a1385559bf2cdd0ec68c47ab3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.666/veryfront-macos-x64"
      sha256 "93313df321a96f0d537563416275e420a8ec39d6df7d87fca6f815ba7c0e2c92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.666/veryfront-linux-arm64"
      sha256 "6fb24b59174ba23d74d9ead8d663ce9732f04baba706366f2a4cb2a6efd81f16"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.666/veryfront-linux-x64"
      sha256 "2e01c11dd0123b3ac2aee28fbba63c16caf978391812b5c89311f0f72004b40f"
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
