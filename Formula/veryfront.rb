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
  version "0.1.177"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.177/veryfront-macos-arm64"
      sha256 "f62c40512d424ee3e14ac475572beec53bdce4d656d797b77db02e2d5b669679"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.177/veryfront-macos-x64"
      sha256 "c0493d7e7584d1504115e81560fbb8111a6991522da1adb5d63e77f1fc7aaa53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.177/veryfront-linux-arm64"
      sha256 "1532446a91c050b6e0faa450b59802ef0462b35032a20b3fc17f882f8ece0cb1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.177/veryfront-linux-x64"
      sha256 "719dbcd376c063306a7ef899c594527efee8ffd63bd3c1d4b66604a350acc4ea"
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
