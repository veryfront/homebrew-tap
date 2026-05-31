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
  version "0.1.616"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.616/veryfront-macos-arm64"
      sha256 "c1adf717f710ab116dd4c729cfa9c9005085f52a1aae291c9bf608ba439f8afa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.616/veryfront-macos-x64"
      sha256 "2e33efe8ed5ceafd5c514b3f1bc6097ca4f605bb0d86f64d6db230c804f10b0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.616/veryfront-linux-arm64"
      sha256 "ce1b6f453b6daabfe185d8e47c90b08649e9e6609472240914c957b6792d9015"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.616/veryfront-linux-x64"
      sha256 "c585dd18ff25a6a2c6d0b90a26501c69dcb599c702a8e3f39a81363a727936d0"
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
