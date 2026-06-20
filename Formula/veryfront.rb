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
  version "0.1.882"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.882/veryfront-macos-arm64"
      sha256 "18427b5d6803d4bf2eb386c83d502c64fd3745bbfadb06461c6ccc9dd4036e48"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.882/veryfront-macos-x64"
      sha256 "414a1faed91e84ca7db37d58bb274a91b8659943f53165fbf9eb3ed1a17849e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.882/veryfront-linux-arm64"
      sha256 "f1bab4efdc6afd201c538becbe9859d7fc78cdaa4fb7becd4ca978a05293202e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.882/veryfront-linux-x64"
      sha256 "f39f692a2be7dd7c5179e68a62336c5dc87a6b1a38fe117a4758ee1a2a0f4169"
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
