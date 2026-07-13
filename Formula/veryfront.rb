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
  version "0.1.1063"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1063/veryfront-macos-arm64"
      sha256 "474c057884449aed034a370ff545230dc8a3bce1767c2865bf78b0de9c04f453"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1063/veryfront-macos-x64"
      sha256 "8c6ad234d828f81ca16bb1144f3beea63eb6a64c3b6624c5693de0164ff9e29a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1063/veryfront-linux-arm64"
      sha256 "7b9b1f8f0ecdbbf844ce0db59075bce4c9611886e1a16e5feec31fceae9718a8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1063/veryfront-linux-x64"
      sha256 "6599ab58842bfe9f08d33a8256f60655be6bb51c7b2fe26d721ff603dbf1d48a"
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
