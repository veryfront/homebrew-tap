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
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.14/veryfront-macos-arm64"
      sha256 "62afed3e6a984d3ae222e369154df729db2756524f2d36b24c22f7f995247b3b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.14/veryfront-macos-x64"
      sha256 "7c9631a4d08d6c00d3e8ad70113d8080c3bc6e20c7d263f7fe39f6e7f8df6d05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.14/veryfront-linux-arm64"
      sha256 "fb04c502828404324ca7c2dfd5281912977f41a9b7b465de1c79ccf4346ee023"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.14/veryfront-linux-x64"
      sha256 "50c26fb719dbfa3abd082fe4c752b4d9237eedda6fc9f8c90429e1ec9468a10b"
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
