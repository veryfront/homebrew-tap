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
  version "0.1.1046"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1046/veryfront-macos-arm64"
      sha256 "1061c82ffd08f75197b84275b97406d93836b8567401241ee5f9c72925a5bc72"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1046/veryfront-macos-x64"
      sha256 "654ebf4209086d050e212667154f22441babf888b5f9c8786ccbb7e1a4b2625e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1046/veryfront-linux-arm64"
      sha256 "5afd0f92d6f1bddc395b6c411c225ea911df990c11dcc2ac7a2da36ee02019c8"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1046/veryfront-linux-x64"
      sha256 "35b27f07a22189dd93a544abba4d029c78c3c79e9a53cb571c7aaeb49f9e00d3"
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
