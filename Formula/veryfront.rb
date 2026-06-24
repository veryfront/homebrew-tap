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
  version "0.1.921"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.921/veryfront-macos-arm64"
      sha256 "e26aba2b1963a12006c406310fea13454605f87fe315db20c68ced02946db88b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.921/veryfront-macos-x64"
      sha256 "64d3f9fcdde833497e0218a09c5d21020ad2c2ec37142f31b07a29581a1198be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.921/veryfront-linux-arm64"
      sha256 "1d13be45b7386df1d3dd440f5cee54b3222d23829a8d86f2a0f4b1a1e9ba408a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.921/veryfront-linux-x64"
      sha256 "b04ffe3eb4a453ba075a64c1025df89d7377df5822d9f9823767c4b2f5b3845b"
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
