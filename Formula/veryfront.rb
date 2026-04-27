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
  version "0.1.280"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.280/veryfront-macos-arm64"
      sha256 "acdc1f7b4d5046d6e8e38ff8e46c6f101d11a9ae8b8a86eb3be6308997ab1aa8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.280/veryfront-macos-x64"
      sha256 "e46f2104045200a46763bce624cece85071f5ce97245359598f14938ad58005d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.280/veryfront-linux-arm64"
      sha256 "51a55b1a8ab19e99839ecda16b3a52efbb82208ebbd27fe23e1a3a17b45fe5ff"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.280/veryfront-linux-x64"
      sha256 "6e8d9efb35cc30a2c1e31f0e1499a24545f81637a3e98362b0423cfe701a9dab"
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
