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
  version "0.1.413"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.413/veryfront-macos-arm64"
      sha256 "1b69e920405deb8833392225329cf7fd4767298da4cbfdc6d3ea7260a1978ac6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.413/veryfront-macos-x64"
      sha256 "cdaad1280be9339ab7bc7f87e6c82816a6e6ad1b413da35caa379dc23962d962"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.413/veryfront-linux-arm64"
      sha256 "90b415f7b171d8bcf5b7fcf81f85a7385f4f5efb2ff82b95576f12c8883ce975"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.413/veryfront-linux-x64"
      sha256 "de4e7b1d7c5d3192d5220a168e6f78a9ac21bef4a325571392c4faa9930401ad"
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
