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
  version "0.1.806"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.806/veryfront-macos-arm64"
      sha256 "157d39af3d2a57c03dcd3934a108b6152040b0ca423f8f959d71e192ec209737"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.806/veryfront-macos-x64"
      sha256 "9090216ae72521669b9c4fb4ca2e55dc1114edc817e1fe4ff2006544c56fb370"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.806/veryfront-linux-arm64"
      sha256 "04dc22502a069e37e6312acbc5d0a0cba4a83207814e554ccc1f28c714ae7a9e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.806/veryfront-linux-x64"
      sha256 "fe4c9e6078a94c8c5724a27c4e402dcf13c0110fdad760237f1ae1417dfbcf3a"
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
