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
  version "0.1.170"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.170/veryfront-macos-arm64"
      sha256 "bedb7007355337df3d635902b92f83f9843f5e2c3ea9436cad76050d09051139"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.170/veryfront-macos-x64"
      sha256 "15e97a2afbc6feb22716749afbe78d31349c86746493a9129691956c17b7787d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.170/veryfront-linux-arm64"
      sha256 "415471b5629577037f9cb9442d3f88625e1c60117022c760ed076673fe7c289c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.170/veryfront-linux-x64"
      sha256 "81775b0284a729e7e066a8f829711453dddb047a61e8d3fb0db29a3012b49463"
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
