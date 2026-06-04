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
  version "0.1.662"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.662/veryfront-macos-arm64"
      sha256 "89597f6d60778551067d6c41f90aa5ae6bd2800b1889e829e42ddf1733d12665"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.662/veryfront-macos-x64"
      sha256 "472803ad6668d9ee19f26c663c4667f2a81666a8c5e39b1b52d639c0d05cbbaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.662/veryfront-linux-arm64"
      sha256 "3f591dd6a39205e83ad95d2c5a5dc5cf320359b40c8b5f1199a24cd97ab534ca"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.662/veryfront-linux-x64"
      sha256 "a951ca4abbc1a904129645c89752ad7aa06f136f401ffebf628f680f36e006e5"
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
