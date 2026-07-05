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
  version "0.1.1010"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1010/veryfront-macos-arm64"
      sha256 "580124f394ab08f5f6432d247c012f3f5a8d641adb9dc90007e2ce6de3fdcfdd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1010/veryfront-macos-x64"
      sha256 "f0411c07a50027c053ee0b485dbaac43ef712d136a6c7578a1d545bcd1dcc470"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1010/veryfront-linux-arm64"
      sha256 "9feb4b8f3a6a9b6d825e2b54204e68e201ae39c79b36f33ecd73ffc38a10aca9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1010/veryfront-linux-x64"
      sha256 "0c7496873b554a1092a4e297b1cc15b7a4a0eabf863d30a60f88b524c880d404"
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
