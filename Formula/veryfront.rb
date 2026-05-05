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
  version "0.1.382"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.382/veryfront-macos-arm64"
      sha256 "47188953ecb6cbaa09d4b97f224978e1f5b0dadd4feb852bbcc90b1319ff4a53"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.382/veryfront-macos-x64"
      sha256 "3446a0932310737d3fb55b6c37016e5fdcec2642ecdc41a36b54c799cda5ecc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.382/veryfront-linux-arm64"
      sha256 "8be4ef989cbb32873e9c6141fc48c69902ab52b032a00ac672d8a820973ba188"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.382/veryfront-linux-x64"
      sha256 "fe288d9303951002b969d9d2aa87f360054676d89e63a67ec5669ee2547a6878"
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
