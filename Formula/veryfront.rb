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
  version "0.1.604"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.604/veryfront-macos-arm64"
      sha256 "2960dd8caf8ba25197ee30eb677409f75eda4bb08019f1eba233a5a477a693e9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.604/veryfront-macos-x64"
      sha256 "ac430e9b132628e6190a890b2df84e47bc2083fff6c30bb50644992fb883aacb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.604/veryfront-linux-arm64"
      sha256 "e6faa767b8e058cb32973ba982397a6941e4ebf07338160237049f55a61c4466"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.604/veryfront-linux-x64"
      sha256 "ce1a2a9e9db9e9b8a294f96b33948da5fd2cedade69d7160428f7cd081c0f908"
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
