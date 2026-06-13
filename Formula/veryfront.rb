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
  version "0.1.783"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.783/veryfront-macos-arm64"
      sha256 "8f27710140231133b485fbd4eab16ec842e15b825bbec48917d3d406f311d5e0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.783/veryfront-macos-x64"
      sha256 "79e8fbb20b77673ea08ec3c90020cf162e9f0cce6241d7bc9e31371e0f897004"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.783/veryfront-linux-arm64"
      sha256 "150c184f1051d8ae4f1cc67f783bb36556320f7e0262eadb09a632e5082bcf71"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.783/veryfront-linux-x64"
      sha256 "df29379860aa1d161af313c2c750f5966340e16d824fdc83efe537e5379a930b"
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
