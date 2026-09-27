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
  version "0.1.1264"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1264/veryfront-macos-arm64"
      sha256 "2188f2ab9e4a77e5634bb186fb2c59efd4e1c9f40e35c3c2ea78f37a8b244d77"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1264/veryfront-macos-x64"
      sha256 "52ee75484a7fdc384d43557e33d0747e74fb48d4fb357e1c99979c9602fcb7d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1264/veryfront-linux-arm64"
      sha256 "8140a97927a1f88f423d6c785020b518d97508573571a6d040884da169b95230"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1264/veryfront-linux-x64"
      sha256 "4df32a061b3e73f69d71cf430d867c04b99fd3c9dc5660d1536251af0ae00b1c"
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
