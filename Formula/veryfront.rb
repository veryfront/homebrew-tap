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
  version "0.1.332"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.332/veryfront-macos-arm64"
      sha256 "0acf4113887b9b36b55fb07630c1f6dc2ed9f8f87c126bbe1a34002c3ccef43d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.332/veryfront-macos-x64"
      sha256 "600be78e94a2df3e5c917c93df858c0dd5917cc21df076639a4e4e03bf6c407e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.332/veryfront-linux-arm64"
      sha256 "681b1a7adebb5db107d32159bf5625d5f3268eb4312d4f9811fa084c9ded415b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.332/veryfront-linux-x64"
      sha256 "7a1a219c151511d02a3c533049f5d5c1913001fb75f49da3106e88874b0766a5"
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
