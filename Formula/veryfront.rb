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
  version "0.1.260"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.260/veryfront-macos-arm64"
      sha256 "abac4ab09c196dd1a3a0228ff2a97ec8cf8f3d4e4b91bf05f3e9e92849494582"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.260/veryfront-macos-x64"
      sha256 "6051474dd90f82acde9e8977907c827852a31fc0e9a72cf02242f6cca1dcebd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.260/veryfront-linux-arm64"
      sha256 "83a1f4230d1aefc305f67803b1d2a4fa5a0c1128082677da4f74dc59ca4d9479"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.260/veryfront-linux-x64"
      sha256 "0cd40571369e43fdf237cb41216431ca6fd210d85f188b0ef64a4517d9b1acb9"
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
