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
  version "0.1.1093"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1093/veryfront-macos-arm64"
      sha256 "deae4ca949b8e3dff89f333c6ca8c10c99f486e3c3852dc3da81ef6f2b264cd0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1093/veryfront-macos-x64"
      sha256 "f89d0c1a8c7afc4da278194f0213dcc2a667ada2f7423c3c4472c357c30bedec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1093/veryfront-linux-arm64"
      sha256 "9a5200670dbd8adbc864d6bd3f59bbac72b278f7a3ff3e6ad4d98a5fa57d0b2d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1093/veryfront-linux-x64"
      sha256 "0c072c74ac9ea7c11df3426946cd67a396efbc0e0b0ac5206fb17d3b6116d20d"
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
