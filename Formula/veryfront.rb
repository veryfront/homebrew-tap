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
  version "0.1.649"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.649/veryfront-macos-arm64"
      sha256 "b91bfd357b49396ecd67831fbe8b3de8b6f88500561937c16f3a68352712a698"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.649/veryfront-macos-x64"
      sha256 "726fa5ab3c62f61c3c91aadfa444d7a70be9554198e6d2ffb50ee51d21cf0cfc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.649/veryfront-linux-arm64"
      sha256 "228c05353f536f49aa5df738fbfa6bbf22724df1d5594da0150121fc5ec0b53f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.649/veryfront-linux-x64"
      sha256 "13d80550fdfd0313fed01f784ce190bed2fbbcfb20606c13d420ae73cc479487"
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
