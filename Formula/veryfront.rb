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
  version "0.1.536"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.536/veryfront-macos-arm64"
      sha256 "67fe20f7b4201d198a9c1c903d76502987c84420028a6341e9e1e68505a22738"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.536/veryfront-macos-x64"
      sha256 "bdeb92ed178e5ccd181638543d53289d43ce0ed341cd2c89a84daf76c98cb006"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.536/veryfront-linux-arm64"
      sha256 "8165f79663f1045d9f8183cc08a1de03219ae217cb39cfa94cdcc8c956ea6aed"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.536/veryfront-linux-x64"
      sha256 "f696a2986109c21256fdbf23e880ca240823b2b4bcda5de6bbbab415743e9a5b"
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
