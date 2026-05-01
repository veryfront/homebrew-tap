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
  version "0.1.347"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.347/veryfront-macos-arm64"
      sha256 "83fc4ed1665d698961c558b629e10a71c3d58657548b6848081b434b41f7c77e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.347/veryfront-macos-x64"
      sha256 "3c5a59f96741e21f1cb6a908a1f100114c4420053aac7523dc7c10710a26038d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.347/veryfront-linux-arm64"
      sha256 "a503d9d42f73f3bb40588b0c86c8a9f11391869ff1cb4a12bfb8568191052aa6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.347/veryfront-linux-x64"
      sha256 "0f3c237d166349370f01d7d8f5c85c37f01a713b3905ad8572b57741aafe1955"
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
