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
  version "0.1.430"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.430/veryfront-macos-arm64"
      sha256 "30a9f14dd46ea57945f44171397229c145757cf0fd5d309f048dfcb0883c046b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.430/veryfront-macos-x64"
      sha256 "c774e1a2846469fdf82b2c4da0a5f8876ab259087f05c9b60775d0902c2552d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.430/veryfront-linux-arm64"
      sha256 "b8a9df42cee15a13f3cf1d7a1f093f1b87063fb61291b135cbfe60a19a18bb8b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.430/veryfront-linux-x64"
      sha256 "9a3f5e1cda6efc4b8602ea882ce1199b010b9465c107af6780230cdc77ec3fc4"
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
