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
  version "0.1.1206"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1206/veryfront-macos-arm64"
      sha256 "e9fa656ed8155a6bbfb90e8d2ed18b9bc0c344ab3235f63d54f7657139fd10a5"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1206/veryfront-macos-x64"
      sha256 "4795c10f5610ece47806094eb5e19575914141c024917a8664ee19bde28c43f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1206/veryfront-linux-arm64"
      sha256 "84f870cba87bdb9b5642e3370b1687d0f0baf5d5494074d832f090e0b8aeba80"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1206/veryfront-linux-x64"
      sha256 "76747415ac294fea86531e571ee33ab24bc292ed1e416b36e0625a692d6c7778"
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
