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
  version "0.1.927"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.927/veryfront-macos-arm64"
      sha256 "7569eb79b7ead5c7fee81ec6dfe46e7d5e2a6acc1e063ba565142e3edc5f3b48"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.927/veryfront-macos-x64"
      sha256 "79f225aa80742686458d2184489ca90cf10394f5c5cc02b8a54501674f4e77ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.927/veryfront-linux-arm64"
      sha256 "b2fb09b3d98264d1eed296a0f053adf588f951dcf3dfe6c5145b4d6ef590b713"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.927/veryfront-linux-x64"
      sha256 "6ce3eca6df77dc7044fd558ce6c1e4194496845cd3b14ef29d9467ef24a2ec41"
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
