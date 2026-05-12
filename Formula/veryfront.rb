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
  version "0.1.497"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.497/veryfront-macos-arm64"
      sha256 "0871f255d8290ced2d822fe44ae24bb9643e87661fe4bf01097d9875e4252bfe"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.497/veryfront-macos-x64"
      sha256 "d7648d3fe65f28e7ca3c6659abcc778717359ea44e8ab37d962ac7001aea25ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.497/veryfront-linux-arm64"
      sha256 "8cbcb1910c928fa49f87c6baf237698d96f90954887b842c2158bd257f112d3d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.497/veryfront-linux-x64"
      sha256 "cc7486794086464c2b1dfb2943500151f9aa9cb5d6107ec6ba3fc3ebf08acb61"
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
