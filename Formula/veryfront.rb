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
  version "0.1.367"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.367/veryfront-macos-arm64"
      sha256 "1f7502c3f007c7cfd7d233b2979b7a0bb068a37d3a40503495bd2f9c9b445ef4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.367/veryfront-macos-x64"
      sha256 "ca9c514454d45869bc1cb9b64cf87309d5d16d74d3e8d89c62b4fc853bf7f12b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.367/veryfront-linux-arm64"
      sha256 "33b074102c39e50d544294de1eabc09f494ffcad4cf01a61526f43211937a1e5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.367/veryfront-linux-x64"
      sha256 "98ddc6f52099bc8b26b15fa954a0c1b78b0725a1242eb9571fb926e3f817c5f1"
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
