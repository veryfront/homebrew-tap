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
  version "0.1.774"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.774/veryfront-macos-arm64"
      sha256 "0f08ee5f4338cee4c84c6a7c8d7714e35b3021632b7bf47b9cb272de95103187"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.774/veryfront-macos-x64"
      sha256 "e39f2d2ec890258a16c584c2d533eacaef70d3e514fb9dda3255431b514e3c28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.774/veryfront-linux-arm64"
      sha256 "ba35c38ce829a8b3d632b0856a08ad603c2b97113b5f7a872049ee9d39f5be0f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.774/veryfront-linux-x64"
      sha256 "84382b00484c34fddef674ff6997ac13b5147f581e24b1cfdd787b374284d8b9"
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
