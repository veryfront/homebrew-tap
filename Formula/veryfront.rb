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
  version "0.1.468"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.468/veryfront-macos-arm64"
      sha256 "c0babd39c90d3e9151f2caa5ce774aa3a0659fb3c7a99c92f9a57ee807d1d4e9"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.468/veryfront-macos-x64"
      sha256 "28b6a9e8ea0dcba3ce0ae4a6caaa07e93b76ca043c4f52ff22c61c983271545f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.468/veryfront-linux-arm64"
      sha256 "7fd4fdf360be67f17bb2ecf182e0fb52f04201a640ffe17c3586e5373b051356"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.468/veryfront-linux-x64"
      sha256 "f3ba60226abdcaec6818f51d73e0cdd712bb3d049771a31f08729a07b7deadec"
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
