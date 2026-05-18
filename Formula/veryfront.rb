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
  version "0.1.550"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.550/veryfront-macos-arm64"
      sha256 "4384c4c38276d40f021c227cc4806100f1e4b199f4e4ee8b00c504112e8a3062"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.550/veryfront-macos-x64"
      sha256 "28bc90b7667295e1310abdfecb751760355428ac5d84e271bac812b2b9d2c255"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.550/veryfront-linux-arm64"
      sha256 "eeb0e2b5b767564146cba9a61f9315bc488d6d2d968016328ce0f01b8ffc3d6b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.550/veryfront-linux-x64"
      sha256 "e9d5a49bd9e08460886a9701fd7122038f43c68b1262805da61dff9e2ec87305"
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
