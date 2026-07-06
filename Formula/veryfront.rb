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
  version "0.1.1019"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1019/veryfront-macos-arm64"
      sha256 "64414b4d693daf5f2491abec179e3c65ee1c9539ee50e707e10fb44af2a62cc1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1019/veryfront-macos-x64"
      sha256 "0d6de61be88a5b511e9a8f977879d5d0369f3620fd96168bec06d10eb0e644e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1019/veryfront-linux-arm64"
      sha256 "c88170386bf95fc807a649af7f2e248f0ecca80a9ec677721330c266466193ab"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1019/veryfront-linux-x64"
      sha256 "882e91abf25bd4abbc98ed71d179b0e0fc25e03138017b067ad9054e56ce9466"
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
