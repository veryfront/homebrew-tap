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
  version "0.1.955"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.955/veryfront-macos-arm64"
      sha256 "cf2621a1fb1cbd726eee0f7387200d3e68299e0b3755ce8930e3e2b97a138017"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.955/veryfront-macos-x64"
      sha256 "b92f57facf07947bde156e2161347a5609ee924dff070120309e7e56af090e5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.955/veryfront-linux-arm64"
      sha256 "17ee11ae59c8234affd5a9e7e4f47735bb6d7615806b00e59331dd284a7c3b22"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.955/veryfront-linux-x64"
      sha256 "e0c1b4b288cf43fa960b3979bf43767aa85b63b2ac3cebfb9288b92df4f4e3ad"
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
