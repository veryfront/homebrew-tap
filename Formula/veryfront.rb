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
  version "0.1.132"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.132/veryfront-macos-arm64"
      sha256 "6665d03d2f558befd914528790097015869927ea8cb6eb16e8e08874c6ae643c"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.132/veryfront-macos-x64"
      sha256 "6d5bc2d171c0bca0801d48419403999b09e74777f107da5ce514025ed9858c65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.132/veryfront-linux-arm64"
      sha256 "388b301739cbb0552a7cc013f7af795d5a2930c95c8473587cdbba3fa40aa40b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.132/veryfront-linux-x64"
      sha256 "a59697d8e749e3a0c189c16eb1f995d854e57b5af9562e87ac1a4d85375dac72"
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
