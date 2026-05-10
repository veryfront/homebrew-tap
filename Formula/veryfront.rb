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
  version "0.1.461"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.461/veryfront-macos-arm64"
      sha256 "56e537996ec20274a84c27500f3c3da31f719a218b1a37a207d345532e84fbf3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.461/veryfront-macos-x64"
      sha256 "13e1fc3b8b2456416b7c5c0edb0fdfa3a866cc719cc961a4df1de7320882744a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.461/veryfront-linux-arm64"
      sha256 "c53b83a1976100209778611cee8148023a1cc1340ebb06c186ae2d41f953db42"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.461/veryfront-linux-x64"
      sha256 "1d244b627d71be4189e62a1b0ff39f251aa1e4f5bb13e0a0748a03ce0591feae"
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
