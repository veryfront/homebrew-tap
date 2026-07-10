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
  version "0.1.1042"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1042/veryfront-macos-arm64"
      sha256 "ff81c30dc0b83d7af5561764827679e441110dd373b6d80bda09510f2dd69986"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1042/veryfront-macos-x64"
      sha256 "99b798e7007fe83c8912ee39874296a314778439dee236bbf48c329b7c83911c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1042/veryfront-linux-arm64"
      sha256 "0bafd10289f2a50010231b8a1b3f3020e62a1000e5aad02099c1fcc86325e56f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1042/veryfront-linux-x64"
      sha256 "c87a5169a0aa0e9f2374e0e82104bfb26b1731517b0827de7adb651bd3572fb0"
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
