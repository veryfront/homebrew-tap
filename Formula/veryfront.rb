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
  version "0.1.98"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.98/veryfront-macos-arm64"
      sha256 "9c13f3a7f0a30ab6ba0ed2a718d7694a8987bcbe47dcddf997c84324b9474bc6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.98/veryfront-macos-x64"
      sha256 "ab72bcdc550c1f44dab237005f198e740359e86592605af8a04e6b2497a7c2c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.98/veryfront-linux-arm64"
      sha256 "1210bf09ab71e7313d0bdd8162a993986ac726fc9a5062ea5fdb45e1a4535578"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.98/veryfront-linux-x64"
      sha256 "60640bd02a418b045e494431c79b6efceed9d2f780f5292fdffbf635031377f1"
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
