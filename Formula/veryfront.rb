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
  version "0.1.1204"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1204/veryfront-macos-arm64"
      sha256 "d79fb7ca5e1d4f81bbbe64ebd44d4359a542b142b9972b81851915a466e4ca3c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1204/veryfront-macos-x64"
      sha256 "32077ea14c2255280416b4d049e82823021e1492bbcf03166990690712dc832f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1204/veryfront-linux-arm64"
      sha256 "bc65264e4605b6961a15971767e6dcc7ae33cc2bc353c83279d4f437225b9de7"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1204/veryfront-linux-x64"
      sha256 "9ae707f6b67681053341a76f00835a3ef241c9cee84bf292556e6f2295b65bec"
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
