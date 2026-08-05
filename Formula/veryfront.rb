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
  version "0.1.1199"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1199/veryfront-macos-arm64"
      sha256 "4ea2a91fa8b89ef9bc7be6a5b0ab7aa6840641128d39101ac9752e675e14c33e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1199/veryfront-macos-x64"
      sha256 "6dd7d33e6b219e4bbd3165ddf91c1d12c9b8540cc74228c5dce51ec0ad1d0c5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1199/veryfront-linux-arm64"
      sha256 "0ca088b5c0671f85dd648fa8466aecc23467b41bcea5f601f662c3e849a2dcde"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1199/veryfront-linux-x64"
      sha256 "477d9191702f806d13c4b53114578b7a739bf7d9343501f046ce0518847e53dc"
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
