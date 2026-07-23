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
  version "0.1.1116"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1116/veryfront-macos-arm64"
      sha256 "f2f1a82b420a4a2407a4e612fc3c4c81974f5e05d413218f7528283bf48df4d2"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1116/veryfront-macos-x64"
      sha256 "d1bc752dd6db5625d3cd4a54a2f03fb6d46a62a4e1dea3337ac20dbc4bdda1b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1116/veryfront-linux-arm64"
      sha256 "06024ad9497fb3500ccb5fc71cad5ce847145f0f8f61285c103e4023be59b0aa"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1116/veryfront-linux-x64"
      sha256 "79bc9ef2a928475eb820187c8c78ec5f5bcab1642bef5a86d0bb30f44c15d2a7"
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
