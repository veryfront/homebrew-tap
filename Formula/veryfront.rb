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
  version "0.1.551"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.551/veryfront-macos-arm64"
      sha256 "117fdce6fe3d0e26a9efa51ce6c190ae9980e15cf689ec7242cc8e53d210f0c6"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.551/veryfront-macos-x64"
      sha256 "36f252c1057f4f0463e613e55b23413911363bdca86f49545a35cf6133f8a649"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.551/veryfront-linux-arm64"
      sha256 "9e557e4436709b6a1c1388985ae9cf47f1d06d73e44a3e92348bf5b736f48dc2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.551/veryfront-linux-x64"
      sha256 "9036da08af0641451c5b09513fc2ee5541ca50393ff8d50cabd0046321fd47f7"
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
