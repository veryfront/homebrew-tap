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
  version "0.1.1072"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1072/veryfront-macos-arm64"
      sha256 "a7ce10ca0acd62e0d51ff8ec2ee5d2554aa3821d25b5dcef2e3a1ecc6799e9ce"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1072/veryfront-macos-x64"
      sha256 "a3720ec5e3c60b6255740d55f39f1ff0b7196013697f5f233442455de21b8645"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1072/veryfront-linux-arm64"
      sha256 "6583ea802b156883da47c36ce6220bb1a3d716831c66ece2f71f3665b3d03cbc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1072/veryfront-linux-x64"
      sha256 "a06b643c182588efc9a26e2f91dfdf43506ad7f366357951e8b578f5e46690e6"
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
