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
  version "0.1.185"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.185/veryfront-macos-arm64"
      sha256 "dab483b49457ddf92a8305f47f0122cd5d8ee3c85d3e4b7082f35fa37afb8f8d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.185/veryfront-macos-x64"
      sha256 "d53b38a238bb9cc035df8c5c8ae639ae239d5eedb626ea4457fc6b62f75b9793"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.185/veryfront-linux-arm64"
      sha256 "757ac1227e40b91a4d010577a97892988a45044d4a74eb87f896e90cc1832b85"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.185/veryfront-linux-x64"
      sha256 "eb4c61acca64d5e25afe857b0ccc846b55b117558504f0c9d57e0f16337b33bc"
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
