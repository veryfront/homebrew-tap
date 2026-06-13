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
  version "0.1.772"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.772/veryfront-macos-arm64"
      sha256 "aec09d94a4a3582fbd0738ca4fddabe1f8e3d60ecd7e2c8f315f568dfc10f26d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.772/veryfront-macos-x64"
      sha256 "6c1671d31eb83c91487eec875ef7895f818a3e6b836f324c5f7b59376c98f594"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.772/veryfront-linux-arm64"
      sha256 "0b86a54e63b78633018eb401fe4ab347479c10abf4009f097ce76744cfcef0fc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.772/veryfront-linux-x64"
      sha256 "16e9df5576001f4cc23adad7f6846269f38f383884e8999a0c064c08818e6e4a"
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
