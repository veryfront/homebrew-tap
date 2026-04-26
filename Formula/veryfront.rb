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
  version "0.1.273"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.273/veryfront-macos-arm64"
      sha256 "9dcf8f2095ddf881fddc6a780c9f3cbc40df4242c18657ffd224fecd831260f8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.273/veryfront-macos-x64"
      sha256 "f69bd00e7cd5a5ff5a6c8eeab71c9a6da29f7e3078b32b606ce50be1553afce5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.273/veryfront-linux-arm64"
      sha256 "95cd09c7d5332a95de835510c31a3200d93fe82e6c040bc355f3391c7e00ef81"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.273/veryfront-linux-x64"
      sha256 "94894929752f56df1c29a00e165e13cda96747fe69a98bb8d7637a6970ffe087"
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
