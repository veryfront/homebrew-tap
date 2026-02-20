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
  version "0.1.18"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.18/veryfront-macos-arm64"
      sha256 "895a777261dc37d8180de5ebf07cb371857e83c536d265feb3e54bb5209f3dcf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.18/veryfront-macos-x64"
      sha256 "2cded753ce8f212ad71d2270cb9eba36ad3634dafc1a113f23c916f9ee09263b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.18/veryfront-linux-arm64"
      sha256 "b6d6ba5f0088133b3a111741b68bf2c182cb2732814a16127dd9b8b0fbefca3c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.18/veryfront-linux-x64"
      sha256 "d0437673d34dc023664767811a1e78af6636c0db0f529ada4cc25f5aaf35318b"
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
