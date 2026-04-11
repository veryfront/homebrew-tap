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
  version "0.1.181"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.181/veryfront-macos-arm64"
      sha256 "379df050c0ac1713bda4112454ef0c950fa12daf6a73b3d8112046e246ef5691"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.181/veryfront-macos-x64"
      sha256 "f1c9c216d379c4a1a80a070219cbb9bb28ad0f44e37caf82acb09a73f4467fd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.181/veryfront-linux-arm64"
      sha256 "76b383b1d44f6097a7a27868402e9e9830f0febdf93152a73eb0cd27f8f89ed0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.181/veryfront-linux-x64"
      sha256 "0daa3b6d5b8307b71d0498f336d1690fbaaff10dc0a905327e39536aa0dc2986"
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
