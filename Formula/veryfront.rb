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
  version "0.1.791"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.791/veryfront-macos-arm64"
      sha256 "c9f21952e4158add57f0a5bba602402113a1531f2cb818bdb46dc9062152f93e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.791/veryfront-macos-x64"
      sha256 "40ed70372efe8b5c2b5dad25896beb22fa731decbd3040fcba5336b249649dfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.791/veryfront-linux-arm64"
      sha256 "e6e930c26d43a114f2cba7b9d17490ba0fe10e7fd69f1da5118533ead2489564"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.791/veryfront-linux-x64"
      sha256 "a8c11d800688e3cd4c9d1276accd769166e51d0fd7170563f210bf78d1275fe4"
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
