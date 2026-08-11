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
  version "0.1.1229"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1229/veryfront-macos-arm64"
      sha256 "7b02ee0ec7f48b90fc31d8d4d3e443d0b7f519850eedcf00b79bc8934d1cc6a6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1229/veryfront-macos-x64"
      sha256 "b42d492e5360d90af33508e3947bddcd7501f3b1d2d8fefd08b1f41527fb1414"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1229/veryfront-linux-arm64"
      sha256 "6422a5027a98e44d22aa1d617e0a9d1ca2cc8114324373305310888c26a69bbb"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1229/veryfront-linux-x64"
      sha256 "cf3d5c4cecf96de7c64bbd5e7786b5bb170391eaf49697fa3ca1218d0ede1060"
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
