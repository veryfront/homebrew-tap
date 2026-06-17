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
  version "0.1.836"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.836/veryfront-macos-arm64"
      sha256 "d3faf29b75d8a6981e879ffba18e19f3c072c222d77731d4322a699458e3664b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.836/veryfront-macos-x64"
      sha256 "92f73f548c9c01d521d5e32a6fad1829330697e3440a9456549436b533cadedb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.836/veryfront-linux-arm64"
      sha256 "9bc67ee40ad3df6b425cf78c19e2ac770351d657f9e928a590efc8fc367abff6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.836/veryfront-linux-x64"
      sha256 "23fd288061448fd6531c8a60def718f28a5c6c1131e78207eeeddb871c40d463"
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
