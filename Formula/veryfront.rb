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
  version "0.1.811"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.811/veryfront-macos-arm64"
      sha256 "488f193b1fe1a96ecc83f90826c0cb721b8265a5193897869851b1735c088a09"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.811/veryfront-macos-x64"
      sha256 "8c3563b1ba31239957ece468699b91e1ba0e71120d757540a2dd0f8def806fb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.811/veryfront-linux-arm64"
      sha256 "325a3b1e2bffa905d88b771db871a1c7e71e64dd0da254215684fe7fce7b5c0e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.811/veryfront-linux-x64"
      sha256 "17eb38a5f85e9dcbb2a4c5e285bd0edfab4651c649cfc9640ef34f835dbd0037"
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
