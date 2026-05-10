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
  version "0.1.467"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.467/veryfront-macos-arm64"
      sha256 "0ba65e6db2d7df544d2c0b955f6e3c2f6a635f2f635bda4df2e452a8c0958beb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.467/veryfront-macos-x64"
      sha256 "19148076e2aaec157c91073416b492de362adbbde6d07308cc32e6b31a7ea024"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.467/veryfront-linux-arm64"
      sha256 "f54c50a4466b13a456068da195feab76f345e1c99c17c2c519c7330f5e4b6017"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.467/veryfront-linux-x64"
      sha256 "5e8fca7684a9981bbfe8037e69ee0b4a1ecfee99ccf59be32cbbb972287294ba"
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
