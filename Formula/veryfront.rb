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
  version "0.1.1246"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1246/veryfront-macos-arm64"
      sha256 "0cb1d6f3d082b19710ff7385614f904f3d843b995d1182eb5453b1eea8ec452d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1246/veryfront-macos-x64"
      sha256 "1883a22265c4272435797eace0548ebcc83e7d0a843ad1703d5e93255e0caa95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1246/veryfront-linux-arm64"
      sha256 "e4f22ca0e5ff4870a066536dc21b331a3ca228dab9e7c0514a82ba161b19e4b4"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1246/veryfront-linux-x64"
      sha256 "9a111a1674e2de6dbd9bb041776b954495ec86ac76cd7b3153a07ad6047d5ab7"
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
