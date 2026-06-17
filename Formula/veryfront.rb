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
  version "0.1.837"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.837/veryfront-macos-arm64"
      sha256 "c2dffee1585c49b993b69b7739643ab2c0e6bd34e0c243ee92df7c418066df9a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.837/veryfront-macos-x64"
      sha256 "a30f467f7989efdf27128deeeb7fa662265391c1b673f50a5701a2325b2907f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.837/veryfront-linux-arm64"
      sha256 "b62b0eb141883d56551963ab8ee339deafade9edc30497890911ca3d02a1be1a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.837/veryfront-linux-x64"
      sha256 "8035c04da3d125f5214f8157972e94875aaed0b1fd986cf6f2f17bf4c47e9b05"
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
