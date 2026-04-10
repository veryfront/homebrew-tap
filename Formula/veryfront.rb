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
  version "0.1.178"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.178/veryfront-macos-arm64"
      sha256 "a3a3d22786f702d4afb2cac9ea959ee1e03e296382e0c8b46a79f72c0ccdfe75"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.178/veryfront-macos-x64"
      sha256 "37c549fd3e52444e6567dc4209fdb01c93f709ea0085c1740d314cad35121b0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.178/veryfront-linux-arm64"
      sha256 "be13919c3c4bb01753909d770ece4700febb0d3a6e99ae10d8dfa0996e15f1c0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.178/veryfront-linux-x64"
      sha256 "1d3e8168c4317e0a64678c3332e6f4b58711f40251e7d81d3338da050c74c388"
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
