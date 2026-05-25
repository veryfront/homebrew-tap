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
  version "0.1.592"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.592/veryfront-macos-arm64"
      sha256 "69f1ccbe30ed1c6a2c7d2bef92a2c20341b3bfb6341680b2aa12a40beaaf8c4c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.592/veryfront-macos-x64"
      sha256 "963f67895ca217ce4b9c738a894bbfe7eb620c977a5c3e9b303bdb1027c64857"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.592/veryfront-linux-arm64"
      sha256 "54c903d49233733097dd243da11cb1de34b9722eebf9b187334019880dfdc8d9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.592/veryfront-linux-x64"
      sha256 "2998f8abb041781fb7eccf4eef1640fbcbdbe52008ff37d7473e8b7fd97288bd"
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
