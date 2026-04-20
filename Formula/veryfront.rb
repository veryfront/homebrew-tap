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
  version "0.1.224"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.224/veryfront-macos-arm64"
      sha256 "2d19d722e2b0b17a5068f618e4bb0c941870972715886c876e8c9528831f3e59"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.224/veryfront-macos-x64"
      sha256 "604a30dc27b0e1f2b1d2a62f56d9488b6721106765fe4ede50cb7d42d6a2ba8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.224/veryfront-linux-arm64"
      sha256 "3bd2c4460e9368dd2536c518e321960091d686d5c78604b8bf40bf2daaa1364e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.224/veryfront-linux-x64"
      sha256 "95b3eb3921cdc3bebcf7785e36afeb73e3a4358b30474fe470d12dbd157c9b75"
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
