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
  version "0.1.1231"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1231/veryfront-macos-arm64"
      sha256 "877ebeb998448581df441a972b09cc01d4c75ce7f9b1a24bbe114a9bff1d3419"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1231/veryfront-macos-x64"
      sha256 "d4dca85e734a6915a47d8b1f917bb91d2bd922dac5f4d99f101ca24e02d24375"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1231/veryfront-linux-arm64"
      sha256 "159a102666181f88cc2965e3eff12608cd1b0757d4cf3d6d5aa178921fe5f1b1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1231/veryfront-linux-x64"
      sha256 "85e2d3b3683898514f60a89d155742125c123b9b2b00c1c308dd58e5a1fbeaa2"
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
