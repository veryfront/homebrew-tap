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
  version "0.1.1147"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1147/veryfront-macos-arm64"
      sha256 "339ecd6e7772a4083768feb0f86f1dbd178eb9f3d3eace4952143a80944161f0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1147/veryfront-macos-x64"
      sha256 "f9d620425b87ef26b626c87a60bfe132ab8c6be2c805fb6baef90e0d9706be7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1147/veryfront-linux-arm64"
      sha256 "aa88c441b60b5a467b33aabe66c4baf8c1bde21e96958be329baadf59ad72a3c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1147/veryfront-linux-x64"
      sha256 "8fbb33327dc0643a9852d69da3dab836521d43bc94415ce2ddaf7dbd97f0b76d"
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
