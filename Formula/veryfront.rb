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
  version "0.1.151"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.151/veryfront-macos-arm64"
      sha256 "f66fe0fa060698abb652ddf122c22e54482126b6a25c9a3551e5053d770eb659"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.151/veryfront-macos-x64"
      sha256 "cbbbe02818bd4c5034bc02d7bef5bc141511431c3f20e664a9e375080eda72a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.151/veryfront-linux-arm64"
      sha256 "0588a26c825027875d2e4eccd0c74258569ebd4033a6b95dc58a1a10d2b8a815"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.151/veryfront-linux-x64"
      sha256 "04fa856fe99c93ab46c7b89a61dcdfbcd821994ebd132cfa1dc6d1813128dc4c"
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
