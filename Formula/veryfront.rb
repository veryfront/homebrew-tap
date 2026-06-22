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
  version "0.1.894"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.894/veryfront-macos-arm64"
      sha256 "e0db85c75949b367ff8b33321f9525483379cf4b4c2998416636b99e79dddb34"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.894/veryfront-macos-x64"
      sha256 "7dcc168c58c6afaba15cc6eb83227f43571e552ea2dec8eabc83dc4970f658e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.894/veryfront-linux-arm64"
      sha256 "95bb6d52826854c9b735148f0685d17f311a7c04c47de644efc30fc9913a3545"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.894/veryfront-linux-x64"
      sha256 "45a9524b254d76f978ce35e22fd043433a3ccff9a0c539b77ce88162765b63ce"
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
