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
  version "0.1.1253"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1253/veryfront-macos-arm64"
      sha256 "c77b2060a3c014a28d32bd758f61dc96c502ef2474dcc83eded79ec8a645401e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1253/veryfront-macos-x64"
      sha256 "771712c8a348ac7331e2cd53c77a511d29b2daff222f39c9f577675e9edfe9f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1253/veryfront-linux-arm64"
      sha256 "f6e2f0caf1f59d3bb4393600a83707dfd2d569c3e71e0ebe8467e6f60d44db3d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1253/veryfront-linux-x64"
      sha256 "bc6785f354889c36dec7869f23b168c9e0c3ab527d6a1298717676b687cf7363"
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
