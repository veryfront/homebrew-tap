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
  version "0.1.408"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.408/veryfront-macos-arm64"
      sha256 "ae31c4140e7b793dd386d05cf3c78c681dbcbb8a226df000e622154ed409c966"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.408/veryfront-macos-x64"
      sha256 "cc5b0e4770331ce33a25a7b1e0b486f22000d63c3af93ec3c63595b251c39c12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.408/veryfront-linux-arm64"
      sha256 "2473f82a5f42783a162c073650c1644c0ca0a947f68fd1753a95ea494cdcb80a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.408/veryfront-linux-x64"
      sha256 "d34ded0f38048a28018c3b9935c5151b0312214b77f39b13ef069728b4f9e596"
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
