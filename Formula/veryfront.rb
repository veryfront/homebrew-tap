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
  version "0.1.1133"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1133/veryfront-macos-arm64"
      sha256 "ce664fe7041becf6c51bfdf5875d5737c9dfb120b8a8df2aba5de42db5f99d0f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1133/veryfront-macos-x64"
      sha256 "cd60050a77a3c3e930789ddabe92e2852a32889a05029f6a3c5c89e2537a0151"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1133/veryfront-linux-arm64"
      sha256 "20ba911541ae0bc7fd14d5c4e598041f3045ebefea33ad4cc153036e01cb83ef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1133/veryfront-linux-x64"
      sha256 "19c3555fa80d7226f0274af9478ab2c24bb37a74eb26568d9d71e039d4a8314c"
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
