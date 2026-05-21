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
  version "0.1.566"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.566/veryfront-macos-arm64"
      sha256 "cdc4532328f3c602771a2fd71514f81918336f71d5bf66c29723152677edcf01"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.566/veryfront-macos-x64"
      sha256 "e20d6bc9bef95be07d3ae9322aba45befee65e962846a0c1f2fd76d08abfe38d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.566/veryfront-linux-arm64"
      sha256 "bd2cd09dc6e45ac7eeec87d6576dfeb7bef12945ddf0817b25a0241773c1bb7b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.566/veryfront-linux-x64"
      sha256 "c1b44d1abf10493a4d86fba53749d96c36f728956e506a8d2a63bbac43c17a35"
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
