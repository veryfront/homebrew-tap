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
  version "0.1.81"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.81/veryfront-macos-arm64"
      sha256 "9e0b2148b42074a2d2bcc1c40efa29fac14b299513af6beb313232a19e6e714a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.81/veryfront-macos-x64"
      sha256 "2b458144a43518e64c11e642474f5c881f2e7708627259003edff200e7e429b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.81/veryfront-linux-arm64"
      sha256 "c739c706e68a2e2457112f406b43b397198cd8742eb5f91a946402930ccf18a2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.81/veryfront-linux-x64"
      sha256 "3caf2fa9e4f196164930a56f8d55b590b3c1007083c8ee8dc386279859f04d14"
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
