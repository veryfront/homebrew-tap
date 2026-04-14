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
  version "0.1.203"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.203/veryfront-macos-arm64"
      sha256 "efd9724704976a14920ae220b68db2d69a7e52529afdb462aa433ba89b4c7d6e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.203/veryfront-macos-x64"
      sha256 "2aecf1ff1c873e7f6ea61c1b9e00eeab3ae9cc631a36b0eefa01e425de116c05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.203/veryfront-linux-arm64"
      sha256 "4135b705a1e8e9937e79630c58103b6ce163b9e4161828c9b1b8e6f5acf179e3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.203/veryfront-linux-x64"
      sha256 "8398701c98e7877f6537e1fd60fe26161a99f67c5363765218590dfd2522bbcc"
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
