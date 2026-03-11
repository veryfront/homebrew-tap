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
  version "0.1.56"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.56/veryfront-macos-arm64"
      sha256 "e13a6117501441a75ded6a76fccdab5a5bd2f3c8bb152ba0b46ea36d5f9dc282"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.56/veryfront-macos-x64"
      sha256 "1ecbb6027ddaa17ccbfe31918c397bdb0e489b893d6058d592b83ff2448efd78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.56/veryfront-linux-arm64"
      sha256 "ffecb73e0029fb53c86ad22c2156cb29da1ff310135d588a73b7d28488f68413"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.56/veryfront-linux-x64"
      sha256 "3ed8e746acb43873dab7e813e5d9d252a8c3d248b1859bd8339c6bb9c38a36df"
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
