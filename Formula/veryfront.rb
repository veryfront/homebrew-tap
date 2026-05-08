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
  version "0.1.424"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.424/veryfront-macos-arm64"
      sha256 "2c212ac17fad3df9ea8fe34239c392e9f4e67b13d47122f583e0032fb9dadae4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.424/veryfront-macos-x64"
      sha256 "061ec9523fe480174a6cd5e2a949872fc4aa5c13ee09bfad0accee993f899b15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.424/veryfront-linux-arm64"
      sha256 "0ba2dc95aa06215e016cc27517d5565dc28bd2a4bf9c9477bcbce4b8bc57308b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.424/veryfront-linux-x64"
      sha256 "1448a120beaa27cd7123ce9024521d46869c7a4f582d7dacaf748798622f9861"
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
