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
  version "0.1.1102"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1102/veryfront-macos-arm64"
      sha256 "1957e75918cb9484b6468c84e6e14cced7301b7ad877c843460106289b8268f0"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1102/veryfront-macos-x64"
      sha256 "d9967072bf20c26a69a4ed404bfd9edb2bc53c92a70fbfc66957267aae29cc44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1102/veryfront-linux-arm64"
      sha256 "896e47e05bc656c3f5803a1d68f3c9ad3dd91e94f4f137e9bc530caf2f805c56"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1102/veryfront-linux-x64"
      sha256 "efb568162a76d03ba2f34f8ab5ed7880c7aa60f538553e3f75393981dfae7e65"
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
