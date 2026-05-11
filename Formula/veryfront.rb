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
  version "0.1.486"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.486/veryfront-macos-arm64"
      sha256 "664a3434221f1418354a088a1763de42df27ef73b95e27bd79fa24227206b028"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.486/veryfront-macos-x64"
      sha256 "526da5eca5f1d54665ef531f5ee13fd4e8950f5048814d9971956b7c10c6e384"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.486/veryfront-linux-arm64"
      sha256 "94731b130a3b91c1ca65930006ee9a0b9c8202ad2056ca49fce450cc8dc37fd1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.486/veryfront-linux-x64"
      sha256 "10487448b0756c74d226868e7e0f7b1662ba3b407944a54c29d4bf7462e446fe"
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
