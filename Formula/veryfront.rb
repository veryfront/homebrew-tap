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
  version "0.1.485"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.485/veryfront-macos-arm64"
      sha256 "a8dd05cc307bb1658b0fc1a10dcfcab6bea7c82509855572b8c0ac85635ce939"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.485/veryfront-macos-x64"
      sha256 "6030ff4b574023a7dc36a75e513de70f95369378c50741accb488afcebec52a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.485/veryfront-linux-arm64"
      sha256 "c39af14dd87c44f0b863839b11e52222728f395c094b5aa8edd0b38148024dd0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.485/veryfront-linux-x64"
      sha256 "047a854e64454579c455588bbb5042d5952b171ff844e740ea7b77d2ec785ffd"
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
