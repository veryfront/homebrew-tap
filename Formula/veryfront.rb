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
  version "0.1.1216"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1216/veryfront-macos-arm64"
      sha256 "357d3aa31b92adb2a369736a2794afb0145ef9ec0c8b163af76ac64e35bcc322"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1216/veryfront-macos-x64"
      sha256 "3858b0bb9d9e03e0f4375b4f7e1161dba7cdccb80f95e9330a38d27104796efa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1216/veryfront-linux-arm64"
      sha256 "9199fa70edf81934637320559541f801b61e17c3dc6129e860331293f94c874a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1216/veryfront-linux-x64"
      sha256 "72a41f208ea7858539e0f84127e7bed4e974ab798c207fa50bdd9acfb9ce8def"
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
