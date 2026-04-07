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
  version "0.1.142"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.142/veryfront-macos-arm64"
      sha256 "bd05205d62d6e978d69406a8adaf57c705f03f5dfe7e6e3fd844089f13c44959"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.142/veryfront-macos-x64"
      sha256 "1e6286344a3f577d2d2b0b2e508941a0280a7b7513ed25f5e3fc512d7ba8b5f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.142/veryfront-linux-arm64"
      sha256 "ae4be03babcfff047efddc18e4777fea72dbf7ea2b65fe87bcedef30248f9a93"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.142/veryfront-linux-x64"
      sha256 "af9200085f21b8a083b5ae060f532e6d11a89a9d1941bf593abb685a4eb0a76b"
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
