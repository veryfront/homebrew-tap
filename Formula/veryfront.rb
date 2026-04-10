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
  version "0.1.156"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.156/veryfront-macos-arm64"
      sha256 "656621ae2183e195f7ac7cb8c231f12a8d4650046706e353d517c4fe1745cec7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.156/veryfront-macos-x64"
      sha256 "29bd96b166d8f4276c6bbc0ffb0d4ae5a3e11a3c46f355a016b3ec1f894a6160"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.156/veryfront-linux-arm64"
      sha256 "637237959faada20ba4b7c5b3220ec5953665697bc987a89befd891700c66e68"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.156/veryfront-linux-x64"
      sha256 "f6339e5990936fccb5f96a054d1a44af0b0a971f1aa088d9e7f0a7882467567d"
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
