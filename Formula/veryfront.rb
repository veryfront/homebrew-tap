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
  version "0.1.514"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.514/veryfront-macos-arm64"
      sha256 "14a571fc10ca66ee56047882b34be06f97ed4014e729a6e8e67810df7d8e10e2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.514/veryfront-macos-x64"
      sha256 "6be20e722cf0c78782bfa1866078ceca91872e486db1a3a8dd485c6ba0cbb39a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.514/veryfront-linux-arm64"
      sha256 "fabf4e7795bfe1106a6ddf6136bd02809c5870a385e7a25cb64e16224023df55"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.514/veryfront-linux-x64"
      sha256 "3a815d1e13b1fe005b2dac859128621778d7f7de5741322c042ebdb8432daa2e"
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
