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
  version "0.1.1045"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1045/veryfront-macos-arm64"
      sha256 "b254e260eda8da18ce2cb1dbbae9ceefaca0027835c1e985c66a29fc5e9457b3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1045/veryfront-macos-x64"
      sha256 "ee6621b6d6fc737c46030d4fd5dfb54b1f27d9b317f175990f891848cbecc307"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1045/veryfront-linux-arm64"
      sha256 "2319d448b1bd71fb70ddbfb757918bbc8aae0eaaa98d7104fa61a587b42586a9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1045/veryfront-linux-x64"
      sha256 "2d332c110616d3e4fad779744ed6f9d5097ce9947fc274244a3745e800e85f27"
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
