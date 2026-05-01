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
  version "0.1.335"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.335/veryfront-macos-arm64"
      sha256 "b6f1317fd945b3b814a45049c1ba89077cf5d296134688a14d8d5815ca8a1152"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.335/veryfront-macos-x64"
      sha256 "37da841885eb77f5dad74167a391355fe4aa61107882a1c143e89532448e90f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.335/veryfront-linux-arm64"
      sha256 "8c36a9041784cd7e7f4e28f5c50766437c5155e773413ee498e2c56775ac2c87"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.335/veryfront-linux-x64"
      sha256 "7ac35d0fb8f952a5b87b1d51eb0427034cfbe98a1bbaa71a135d57a06c439d66"
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
