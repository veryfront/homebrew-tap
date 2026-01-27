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
  version "0.0.92"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.92/veryfront-macos-arm64"
      sha256 "aa0b0e2c11d8478defa70e22a1c906de544a72313dc2887e05d267726f10e94b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.92/veryfront-macos-x64"
      sha256 "cc2bd6fdf5135687d61d8a818f26f1876f628d0e1ac305d1bdc74911906b0191"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.92/veryfront-linux-arm64"
      sha256 "05d69d2b4e6b41d51f4cd1d4387905905738b9851322e75d11045350968ebcda"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.0.92/veryfront-linux-x64"
      sha256 "e597930d5c80bdde71697052e629d80f839a7f36afa72f9afe4fd397849904a0"
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
