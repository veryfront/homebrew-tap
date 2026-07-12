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
  version "0.1.1050"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1050/veryfront-macos-arm64"
      sha256 "085fa0aa152c6cb5aaefd2c9c45fb07e4b57d6738356fe5ec2fb4f61a5c9e960"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1050/veryfront-macos-x64"
      sha256 "d844b230420cb4985ce19b7e906c2e1129e82009a2608aaba456246f3ad0e588"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1050/veryfront-linux-arm64"
      sha256 "f4a658f54d21206609639f0cc2d717d6406f0b5c1497679eef0d494dae0d240a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1050/veryfront-linux-x64"
      sha256 "ecd4f5ad58670a135f2c0d98a12a948297a54458ff0a38d06b992c89cd29128e"
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
