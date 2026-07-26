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
  version "0.1.1154"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1154/veryfront-macos-arm64"
      sha256 "10c133a478bf65af7591a811e674ab751aa04ea8b8efd664f9599ac31ddcb729"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1154/veryfront-macos-x64"
      sha256 "3773e2119745f9ff0166cecd903f603faea63f243b1b8a0d8a74c74721de1493"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1154/veryfront-linux-arm64"
      sha256 "ac22b0bccbc2b71a0c9ce6db9cf6ca254b5572b673f205abefcd05b2e6b6ce3d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1154/veryfront-linux-x64"
      sha256 "f6adb1133949ed9b7453d9bca5a50c553764e2a633de5b466b5c337b2764fe3f"
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
