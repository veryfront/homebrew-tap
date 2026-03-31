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
  version "0.1.112"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.112/veryfront-macos-arm64"
      sha256 "8c5399260c8d48cf356a3d1f7f019e0822926e3bc354c80bbcfdc9aec63e8b4e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.112/veryfront-macos-x64"
      sha256 "83a2d0bc25146808d42db56885f12aec50bedec5c7826250bced38f02f9bb0ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.112/veryfront-linux-arm64"
      sha256 "845e7151686daad49ae6c7b196738da032a9dc11a4e2d3617a05a09d0bc7babd"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.112/veryfront-linux-x64"
      sha256 "8612b2768e46721d8c0299d9b7925f425784fb565f218cdbf7e63ec66295e7f5"
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
