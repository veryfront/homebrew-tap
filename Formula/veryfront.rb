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
  version "0.1.788"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.788/veryfront-macos-arm64"
      sha256 "ca9adc521d01b89365a16e30317c6a576c089d4b98e68b88a31bd51f03c45a5b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.788/veryfront-macos-x64"
      sha256 "294f3b5dbd84d74479d5514350c0c00d3c0bc3a758008cb3717859aabd00c755"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.788/veryfront-linux-arm64"
      sha256 "715a96ba4b77781109a79b995d86517e0a18b46f407669643231d715f8e030c6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.788/veryfront-linux-x64"
      sha256 "d4f19e4f3228edaed100b5b46b214570d2d94b1e2b39d46460ac56527157c6b5"
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
