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
  version "0.1.997"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.997/veryfront-macos-arm64"
      sha256 "e7c47b5aee4d1189cdf6d0c1925a204758228e2ceea7f4e6498e4650d905edf8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.997/veryfront-macos-x64"
      sha256 "771d1f535e4519ae4fe934cc01e5081965d3663128fa5936e71c37a72d1a3a3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.997/veryfront-linux-arm64"
      sha256 "a2a21ba32d9e02a8f8eefbfcb9d06343e16024f632c116bf9fb21bddd58a713d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.997/veryfront-linux-x64"
      sha256 "9ad8d90ee2895fdd7b07afee4817a014ecc6681fd813841c1ef09b70de968bbd"
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
