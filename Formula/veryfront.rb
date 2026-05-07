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
  version "0.1.404"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.404/veryfront-macos-arm64"
      sha256 "2a984c8f1a0ddffd142fa47771c8806c5fd7c8c25c3dab440c171d6a016e6cef"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.404/veryfront-macos-x64"
      sha256 "0c71a14fc8059a742bbf98f94ad360e44d4e04cae285b300e0c5a1c11a46854d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.404/veryfront-linux-arm64"
      sha256 "cba6c9365e2238a5f564a5d8d5cb72a9b6536e8001fc750cf9544e198e6b89ea"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.404/veryfront-linux-x64"
      sha256 "89a13815a67c8f45b45a087f56bf11d575dd23ff8f9cdb1ddc4c3bb4c8e88c85"
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
