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
  version "0.1.626"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.626/veryfront-macos-arm64"
      sha256 "e3b5039adc7d4e1b60d6c0e079dbc9f4fe39670190a7332a465df01574dab8a1"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.626/veryfront-macos-x64"
      sha256 "0372818e92a6909b61c872d40b985757d244669b83b756162de5e210ab0df051"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.626/veryfront-linux-arm64"
      sha256 "5d6f2c9cbf8cbca846827692e0f295bbbceb5103bfefbb28bba7c6dce42f3b1e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.626/veryfront-linux-x64"
      sha256 "cd5766c6050915fea12bad83daf35de4e187b540faa977b537b7b41d23637f6f"
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
