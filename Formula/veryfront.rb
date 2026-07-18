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
  version "0.1.1085"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1085/veryfront-macos-arm64"
      sha256 "7a191ec2ca63ff1389d961c55fa54765ceca223ea26d71f181b11d6755de43e6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1085/veryfront-macos-x64"
      sha256 "02dab836e7b88f83582bccb2c404c44b68012976c31323bc94eb10f51c947e7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1085/veryfront-linux-arm64"
      sha256 "b74d13291b08a3d0957700d03e583e563f2b6184e82e14e298710c9025ef27c0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1085/veryfront-linux-x64"
      sha256 "a809a1713d86b596b3b8b1b0a64a851a3b46c74b797e3f85672575e1fed1a518"
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
