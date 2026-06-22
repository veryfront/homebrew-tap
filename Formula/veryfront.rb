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
  version "0.1.898"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.898/veryfront-macos-arm64"
      sha256 "a6e35332c6b77ad6c0d072a0a92fba7a78a31f7ac06a93f778716f8e365f6e7b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.898/veryfront-macos-x64"
      sha256 "2ebe28e0a8a1e9aa5fb0aaf0f8390a238ef3dbadde3a7d164184a5ec4632ee26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.898/veryfront-linux-arm64"
      sha256 "346986c50aee6c948089d11d1afa38679147e6daa631943bb15f191235fd861f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.898/veryfront-linux-x64"
      sha256 "94325a7769549db573b102e4515b0a98baede5cfd9ed2e8521aa999f815739b3"
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
