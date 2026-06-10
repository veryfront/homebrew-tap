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
  version "0.1.752"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.752/veryfront-macos-arm64"
      sha256 "47f4b474c6f9eaa6a418527154aa9105dcaf0186780547872e8b2bac2ccf191b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.752/veryfront-macos-x64"
      sha256 "de62def8033e4b3345ed97a28d159f08d38010c024323bba88ef7c79e56edfbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.752/veryfront-linux-arm64"
      sha256 "4364f10dc6b50588c2a0d4c10a6066e83a8005ae2c50ad52641d0621eada08aa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.752/veryfront-linux-x64"
      sha256 "2ea10df99a8ec4d9778a5c7abccc5900c3444e2707a420e5559067e6baba3e20"
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
