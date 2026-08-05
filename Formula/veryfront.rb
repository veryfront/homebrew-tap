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
  version "0.1.1200"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1200/veryfront-macos-arm64"
      sha256 "d3070d6fa7ad25f8d4ba745c038a6540f5fb154e973794fa76723e4c8afb481b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1200/veryfront-macos-x64"
      sha256 "da46a729d63bb37f97e087f2e22a4ded07732af1bf1b9930d1d9e9e16dd7ca4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1200/veryfront-linux-arm64"
      sha256 "c40368c16794680dad1df8267dbae6592e083c29ce4f02d70b26d4ab27c5471f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1200/veryfront-linux-x64"
      sha256 "79b5b26ef2ba1965b0f22102ff71a27d002e085e28a602c723f1859a11024284"
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
