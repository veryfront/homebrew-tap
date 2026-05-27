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
  version "0.1.596"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.596/veryfront-macos-arm64"
      sha256 "73091e6e17b4b1985cad0ce66b849f6f0f453bd07670a60fa66a14be2fe29fd9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.596/veryfront-macos-x64"
      sha256 "a61eece4fcb4013cef003fc8aa83dfb4b999c7c178afb7f28d17be46247a2d71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.596/veryfront-linux-arm64"
      sha256 "978e4b016176f111d3356317f8a8bd8358bb06ade49e35da467b6553d2fc5deb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.596/veryfront-linux-x64"
      sha256 "1f3d38ae867fa65c88f5d08aad50d704426cc8de44750c053d958f213a94a5f8"
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
