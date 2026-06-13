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
  version "0.1.773"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.773/veryfront-macos-arm64"
      sha256 "4e8083d2bf9cc0e554a5031d176238b8459fbe93a6f5bb8f77ab472bd6a88c73"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.773/veryfront-macos-x64"
      sha256 "d7901b8becca1089ba0f8a1779eba843a23237a48350a8ba2185be13738f9a66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.773/veryfront-linux-arm64"
      sha256 "40d89c8e5271ee1096050011a751ec5be16f12674c209a08d2abbf0fb55ccb6f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.773/veryfront-linux-x64"
      sha256 "0dd97fb27b992515372764a213005ac8f260ef8434b70cbf228d4f241a1edfe5"
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
