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
  version "0.1.516"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.516/veryfront-macos-arm64"
      sha256 "ba0e002ea1e790ad45dd7e7cae0383ba524e583de4291642ae4698f6954be88b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.516/veryfront-macos-x64"
      sha256 "88070be8a4d6ef7c7c376143f47ae1be619ffa7931b7150730a6438c1616f040"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.516/veryfront-linux-arm64"
      sha256 "d4c8539b9a1622f9a0259f0decb7d41e5be69c89a92be5f00bf06094c4ca36f0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.516/veryfront-linux-x64"
      sha256 "5729dba7847f7eb5692ef564325e5c06ef1a35dca33817c291624c9f2ac12a10"
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
