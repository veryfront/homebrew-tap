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
  version "0.1.761"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.761/veryfront-macos-arm64"
      sha256 "24185ecd767f3966b2300b6fd45723b7ec5c2fc16bb99d1dde1f432d884ade75"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.761/veryfront-macos-x64"
      sha256 "73070d21b7c89da06bc3d3e2de8af27e838b39b9ea42dfa0418be2436b768f68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.761/veryfront-linux-arm64"
      sha256 "24536ebace678c1822f05e455905cc2ef137504bb1aec883be582f0548c3b5d1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.761/veryfront-linux-x64"
      sha256 "0691293b53eae765bb398809cb9dfbf57c681a91548466a4efc909b064c74a6a"
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
