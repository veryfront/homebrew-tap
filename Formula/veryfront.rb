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
  version "0.1.782"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.782/veryfront-macos-arm64"
      sha256 "16dce198541e313d2949a976c844daa3d01161923776f03a0b3a07ed9853c75f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.782/veryfront-macos-x64"
      sha256 "bcac066dffc2d24c1f280a1a13c0e727c48014836a20f78c7f70b5dbadee9cfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.782/veryfront-linux-arm64"
      sha256 "91301c9a862808c688a54d972018c2e617138c4af46b997d7bc3af825df93ca3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.782/veryfront-linux-x64"
      sha256 "562e09c2ddca0bd0af9ae3fb228f7d5a8bde2a3d5df5980efe3881cfeb3d6d0b"
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
