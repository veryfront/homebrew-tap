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
  version "0.1.812"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.812/veryfront-macos-arm64"
      sha256 "c0056ce2ec145ef0962ce1f2ab4a129381169629d5393c790658b98e531b0182"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.812/veryfront-macos-x64"
      sha256 "f8bd427d4684b44e1e03562cd0f29e616b63d6443c1e85b35771afd05c1883ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.812/veryfront-linux-arm64"
      sha256 "127d1cc7a03f8495a53e939ead7f1a45af9de1ec753fb591e5f8076af9957ce2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.812/veryfront-linux-x64"
      sha256 "109655457bcbfeaa5c9c0f7ce803804f08d8aeac726f28f89214d81c1a15a37d"
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
