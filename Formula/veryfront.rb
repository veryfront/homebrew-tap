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
  version "0.1.75"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.75/veryfront-macos-arm64"
      sha256 "9a5222e4c69159602f5987c8c211fd0bc2da05b326b5b508903dec72c76fe81b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.75/veryfront-macos-x64"
      sha256 "e0bb420b2521e665aa75c06f5df5bc88e8235d65f88ad7138f746d866574ff1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.75/veryfront-linux-arm64"
      sha256 "967a4d8dcd30e05d662a7a11621d6fe3cc876466b2893decd0b8dbfdbbfd0d30"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.75/veryfront-linux-x64"
      sha256 "4c2b41fc11ccb505f8ca8f2c14dfd668550dbe49400ff9907b51f607385ca6bf"
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
