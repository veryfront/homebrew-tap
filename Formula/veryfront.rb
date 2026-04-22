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
  version "0.1.245"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.245/veryfront-macos-arm64"
      sha256 "92c40a6f80290e57d519e8a18e6e523745029b3288d75aaa60f9e7c343a0332d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.245/veryfront-macos-x64"
      sha256 "950c6921853783ea26f16906d4f83cc7273ba22b74807ac2d946d787515bf5e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.245/veryfront-linux-arm64"
      sha256 "9dfd610eae497155d9d1380661977b60534b4a6618edaf4ee66fb55b8e550385"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.245/veryfront-linux-x64"
      sha256 "b6ace42817220f4f48ee886a5b27b7f0b338b3b3f59707c5ca4fb3a998eec634"
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
