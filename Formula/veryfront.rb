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
  version "0.1.208"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.208/veryfront-macos-arm64"
      sha256 "632a871d0ed32b46cc14d31e8982148e75397270966a5b7b62ef6cb3309898e3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.208/veryfront-macos-x64"
      sha256 "f8c63b5f3fe9a8b2c68bbd61fdf0b27bdb4bf53245b4753d150943c5b1314d7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.208/veryfront-linux-arm64"
      sha256 "4768e24bc5eb0ff7ea4c271d13940656f41b25f74328cbea307940a1f97a19bf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.208/veryfront-linux-x64"
      sha256 "f967d3d4b2900dbb75561a7fc5f1794660a44f67e31f5c96f85c91f3f28ed67c"
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
