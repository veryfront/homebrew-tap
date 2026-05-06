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
  version "0.1.398"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.398/veryfront-macos-arm64"
      sha256 "45483ce4a24b4e71b02e2ad5f47b5aea2d3f838cc77508e5f81c472b85ce4c31"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.398/veryfront-macos-x64"
      sha256 "98456118e0cf84b75173f17e2f6692036e96c8db848593207cf9e174e28b0d0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.398/veryfront-linux-arm64"
      sha256 "9d90225e70058869da478469fb5d9a38181ee17714cb068ae605d462e55c18d6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.398/veryfront-linux-x64"
      sha256 "f609dfbfe3b2902a10ae4d38b60ebd98e6339268a551e3b6fcca34e397a929cf"
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
