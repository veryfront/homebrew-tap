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
  version "0.1.35"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.35/veryfront-macos-arm64"
      sha256 "27b3bd65b96d083c51389da021ba701c715088d0e86326b38a7a5ae4ef48ff7b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.35/veryfront-macos-x64"
      sha256 "4f4c302a19ae95d16b86582761e3c54adcded0af21aa50ecbefb37728e46adb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.35/veryfront-linux-arm64"
      sha256 "e816b97cda0b8f6bddd46320f0f6e803ffc0960e5c986abd38528189af0d4298"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.35/veryfront-linux-x64"
      sha256 "2599f14f220abb81574df1029d0461ab9406a8f3f9d7eff2e23c92ed53501435"
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
