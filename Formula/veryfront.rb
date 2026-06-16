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
  version "0.1.814"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.814/veryfront-macos-arm64"
      sha256 "b524deb8ade22b8b565c7afd60f6031058649dbb0b1617ce1dfebe77112de369"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.814/veryfront-macos-x64"
      sha256 "9c6c2a3b353bed5bb3eac715274a7a5ad175624a2e699973284ff9be48b82df6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.814/veryfront-linux-arm64"
      sha256 "adcfbfae55e32a41988271c59f85e26c059826183f1e797db6a236dcb7fe4c06"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.814/veryfront-linux-x64"
      sha256 "85a4d6132b89aac6b0272cd775b28ce609834e9528db7991ca8dae59c82b38ad"
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
