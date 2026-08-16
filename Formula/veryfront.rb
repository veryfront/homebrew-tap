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
  version "0.1.1239"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1239/veryfront-macos-arm64"
      sha256 "c08f46eab3f3a1c8a3ec63f3565c7dd3bfb0772253eacd766ae0a0ed18bdcf40"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1239/veryfront-macos-x64"
      sha256 "d1fa57d2eaf94fafd90d1c6e3dbd0be6fb187fd329db87c853bd21ac2ee70800"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1239/veryfront-linux-arm64"
      sha256 "cf5af3032d976d681ee727e9d32bfb7625e882e4b3e1ad983ecdb3457d825f13"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1239/veryfront-linux-x64"
      sha256 "bfe316b803b3459e24510105a734b47ae871294a768873969d78f3a3e72ae5d7"
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
