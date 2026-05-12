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
  version "0.1.501"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.501/veryfront-macos-arm64"
      sha256 "866d29d4b5016c52fb48a6a9007a0cc9a389f27d56217a4049b4b738af062e97"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.501/veryfront-macos-x64"
      sha256 "41fc3d93b76e3d752c08c1161e165ea4431217bb8b18f5bfcd1f49f7567fc9c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.501/veryfront-linux-arm64"
      sha256 "b45f615f3fbb65f46b4735d6aeb1cf37780a52133a0097fa834645e2658b5e42"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.501/veryfront-linux-x64"
      sha256 "759678197c159ef94803290356defc94c6ffa010aa90b774a2713a51fafcee77"
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
