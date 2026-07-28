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
  version "0.1.1172"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1172/veryfront-macos-arm64"
      sha256 "96b72970b46e5c1e4254e159d4e87d22af7115d3c8aa618ee9d6d24b1f99787f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1172/veryfront-macos-x64"
      sha256 "b762a0e49902640681f4514dfb156cf4eff4f410916707ac349ff9cbb0c311f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1172/veryfront-linux-arm64"
      sha256 "007764cc9607a54d0c3ccd35960b45c91b445ab0c1b9a8867e59416927946d0b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1172/veryfront-linux-x64"
      sha256 "2157856ad087688c626bf35299a79ad2a1607ce2d6665a1cf951e83ccba05e8b"
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
