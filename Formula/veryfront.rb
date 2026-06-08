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
  version "0.1.689"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.689/veryfront-macos-arm64"
      sha256 "4805b9a500d0ff3d2773de760a3fdbf90e147da5fe9bbdb97fccd1c61890659c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.689/veryfront-macos-x64"
      sha256 "d4849fcf7e5d312e18677c4daac73d53d362fb547cc93ae52cfc8b42d1137883"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.689/veryfront-linux-arm64"
      sha256 "273c112151c2ca41d3aba651410c6974aeb48e04868a3c9f60c4c407b946bfeb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.689/veryfront-linux-x64"
      sha256 "7f30c5a1615629c983679c7308b1f7f166b27269bc2bc9a9ca6254e7a012b7dc"
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
