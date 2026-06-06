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
  version "0.1.676"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.676/veryfront-macos-arm64"
      sha256 "3f14d3b4ba421b2b1ce8804d18a3b836e15752c68b3e2000cb1afe03e1f40399"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.676/veryfront-macos-x64"
      sha256 "44ce64b5a57bcebfe4cee8859f72bcfdf9486c38f4486cfaf01e9e439fcc2daa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.676/veryfront-linux-arm64"
      sha256 "88a8c925ba064293ebc1e7519676a678e28ce4020ee8c68c0bf8067ed99a3409"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.676/veryfront-linux-x64"
      sha256 "1a87e111499da17bae6bb86803cb766e1ca3d518886cd323d01d8a911106d42f"
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
