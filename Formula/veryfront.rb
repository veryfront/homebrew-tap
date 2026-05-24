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
  version "0.1.590"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.590/veryfront-macos-arm64"
      sha256 "34f321be497812d5df2d267a7b958ca1fd79bc1d20593902885de7fec01d7c2a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.590/veryfront-macos-x64"
      sha256 "756a60f8f09c16f167689a8ede41c7c6706253d56394f2b3e53972613fdd6605"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.590/veryfront-linux-arm64"
      sha256 "623cf1e806d3a0e40195305dbe8e94332952fbda46d567d74d7319a2f63d1e39"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.590/veryfront-linux-x64"
      sha256 "132afb7ed987c12aad10d376e74269f38f3bc9dc93057d140ec10fb5e611bded"
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
