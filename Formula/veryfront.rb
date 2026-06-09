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
  version "0.1.697"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.697/veryfront-macos-arm64"
      sha256 "15f6510d69b180d2f49e33cc5dadfac8fe6534c63f050c3970530ea537cd96e4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.697/veryfront-macos-x64"
      sha256 "13b1855e3e547a61b4767134fbf2eaa1f017d40670417f3515133558865d3ec8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.697/veryfront-linux-arm64"
      sha256 "3bc6f3e7cfefa6b80179ed4eeb362cc7e96476fc249f6ae8ff177705d36ed471"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.697/veryfront-linux-x64"
      sha256 "1bc46c53fda22b453b35c7f28048953c91668dab3eeed9b1b324074eb7bf91bb"
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
