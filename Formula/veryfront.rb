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
  version "0.1.124"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.124/veryfront-macos-arm64"
      sha256 "a5adc944c2603d659207b4010208262c095195088cb305fc7da1d0284b65d751"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.124/veryfront-macos-x64"
      sha256 "e3dde92e1678cb03dc3eb3d674793bad18e685441cd9d47d15749250508322b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.124/veryfront-linux-arm64"
      sha256 "8499b27caa5d2c7ab0297ace1d366be66eea63a1e15f85baaeee8d226a4d565b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.124/veryfront-linux-x64"
      sha256 "0ed08f08b50befec9653d933ef1146d9c645d12af85123bf64767dc81c18d98b"
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
