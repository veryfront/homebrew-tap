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
  version "0.1.835"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.835/veryfront-macos-arm64"
      sha256 "0b9a1a537ee243568025d50ccbf482b6bc9c4a43c4be6a8835455a69aa3aa68f"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.835/veryfront-macos-x64"
      sha256 "8908c4fdea1d4e8718c6bf86f390d733993855412cef30d624bad067d85fd564"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.835/veryfront-linux-arm64"
      sha256 "901461f91c9c1dff4820e8d3d419e011b422db8792e7285dc3726c75cb1fff60"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.835/veryfront-linux-x64"
      sha256 "124a63c0a6e5978a85e456049816acd7ce2723200d7f2fee5e1363e92307f959"
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
