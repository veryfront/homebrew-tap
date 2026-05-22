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
  version "0.1.574"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.574/veryfront-macos-arm64"
      sha256 "9d7c6d9a4a11c8b560fd4031e8e47e626b4ac9fa1ace7834ac40d50ce8567c53"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.574/veryfront-macos-x64"
      sha256 "714ecb13d7982f023c9b568a55587f5b81f26679b736b6d0cdd048fcb967c0fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.574/veryfront-linux-arm64"
      sha256 "ecf3fcfc623649b698b411a69d90bf2248f74d7b12719ffe0b58b552093f961f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.574/veryfront-linux-x64"
      sha256 "0eeac9a194e9369cf264149b7a6d1b840866035f59e240acf807d4751627e39b"
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
