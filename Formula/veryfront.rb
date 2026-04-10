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
  version "0.1.157"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.157/veryfront-macos-arm64"
      sha256 "c6f945cc97b86241e30fc9bab423529bf588a4f7a5ce80e40d1b2c202bae344e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.157/veryfront-macos-x64"
      sha256 "26127f2b3075a19541759c3ad37ba1944a7ce4b1a77e22e4cfd4725bb08073a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.157/veryfront-linux-arm64"
      sha256 "1e3cfc4ab3df202266bbfa9e900e0ef78d1cc0bbdd9996b5199c2dda684cfd3c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.157/veryfront-linux-x64"
      sha256 "9946dfcc8dc3aad6af053414b6b03930b271e5802e2d66c84c9dd8f57f99f993"
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
