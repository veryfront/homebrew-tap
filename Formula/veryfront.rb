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
  version "0.1.218"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.218/veryfront-macos-arm64"
      sha256 "88ba70438e4fa1081203e142b381f7df365f572ace9fa6f086bd156ffa955882"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.218/veryfront-macos-x64"
      sha256 "b86974d73ea2587f5c0ea2195ccf484981aa2e1f871c505166cfe1c9f659c5a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.218/veryfront-linux-arm64"
      sha256 "882903775fbcf6a034eb52bda4dd87491b4c3641df40997566abe9c9acebe6e8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.218/veryfront-linux-x64"
      sha256 "984a09ead1abc7489fd19cf788ae671540d8f1ec71c2e6a475106a87a3477161"
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
