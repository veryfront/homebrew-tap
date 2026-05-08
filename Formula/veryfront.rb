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
  version "0.1.421"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.421/veryfront-macos-arm64"
      sha256 "2c3ad00718c29c58129e5f56a22f4994f4914314e864853afd647d8bbd2de0d7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.421/veryfront-macos-x64"
      sha256 "5e45845beda6b8ecf0d796efe7794c6e563f5f16ea5390d6649362612f2df185"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.421/veryfront-linux-arm64"
      sha256 "6c30767b27ed1debf215fe2f38439d175110583d0b35b104d3f9ab5f113a78f3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.421/veryfront-linux-x64"
      sha256 "ab0dff66adc66aa5837b03f5d22ee57acce21ed0c2884ab382e554c764a39435"
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
