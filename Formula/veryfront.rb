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
  version "0.1.885"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.885/veryfront-macos-arm64"
      sha256 "87d4beda02b3c7cea7adc130480a5521546c1221a6218237fe063fa150b3779b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.885/veryfront-macos-x64"
      sha256 "4a25e80d82ee3e8022d883cdf638c05dbb73b116f70a164febf5e7458fe72a18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.885/veryfront-linux-arm64"
      sha256 "ca8e5640da1bece97f70a7c643507f81dbc9881dad794766347fad0173c3d8c6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.885/veryfront-linux-x64"
      sha256 "819744e1099dc2b9c25bafb228a126960ed337ff76c0272e804c23fa48b7c0b4"
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
