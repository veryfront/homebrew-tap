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
  version "0.1.250"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.250/veryfront-macos-arm64"
      sha256 "98cdb3354854bdde9daa6d68aabcd59b234e5457e24b0e4858848174c7a6a30f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.250/veryfront-macos-x64"
      sha256 "27226786d96162d23bc22a7477b781ee54d0838edacd2740f95025a1a14a9de3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.250/veryfront-linux-arm64"
      sha256 "467a5946ef0516dfe3e361a6cab1e4bdad361f3d82fa11dcfe6bc12e4039c3a7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.250/veryfront-linux-x64"
      sha256 "582d16f88fc9302910c3b766717ea382c98e18f1c21280c4b6bfd87edc0366ae"
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
