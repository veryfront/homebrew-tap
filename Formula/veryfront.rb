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
  version "0.1.222"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.222/veryfront-macos-arm64"
      sha256 "a5007504af09cc54d2e6a7c1500f2f7b1cf3c607de911290a2948ea094112a34"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.222/veryfront-macos-x64"
      sha256 "4d3bdf8221731888c9c664adf971a9c3bc44e4bf028629e916ebcbfed9ec0b7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.222/veryfront-linux-arm64"
      sha256 "2cc3510f9bbf7384e2d37d9fc9e5d98a44630f5b08ed9215febf5c78d1a88e48"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.222/veryfront-linux-x64"
      sha256 "3db5ac268543b0a738d0febff291d0919a492a6e3a6ccbb6f7a7b8009934b013"
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
