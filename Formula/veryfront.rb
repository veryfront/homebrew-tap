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
  version "0.1.119"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.119/veryfront-macos-arm64"
      sha256 "121bfca4cb01f60e309790ec54109fbb3285fd09a48a0f41cd7744c4d1a39421"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.119/veryfront-macos-x64"
      sha256 "30389f4d11dc3b3083ca49e5f2c3ebd1a4e72e982a0bd7f23ef84ee852b10202"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.119/veryfront-linux-arm64"
      sha256 "41130104ecdcc8e92117ea5d79e6a6a1d0de332b0dec6c3f59b7f328fe1f9722"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.119/veryfront-linux-x64"
      sha256 "406289b7759947aa51c12fa62683d2ea6cd2f860377cf4e8d60b36401cd34f4f"
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
