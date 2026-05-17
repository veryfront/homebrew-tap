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
  version "0.1.546"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.546/veryfront-macos-arm64"
      sha256 "5e9efc968b57b5e1fb6cf50d37cba5d8c19b57810d7d1a09344f51b8b3afa55a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.546/veryfront-macos-x64"
      sha256 "5a5361d55a7494974c209969f49a11a62fbf34abe803681ebf8f4f9832d5013c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.546/veryfront-linux-arm64"
      sha256 "fec655464c3cad1d7a114f4c0fea13acb893a4be85259f30145300e8930f0695"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.546/veryfront-linux-x64"
      sha256 "bf383d81d843bd5390705f18e969be7738c9235711389bb475345d9d973d8a78"
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
