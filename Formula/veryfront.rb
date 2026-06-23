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
  version "0.1.919"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.919/veryfront-macos-arm64"
      sha256 "9cdceb7a319deade06e4a321ee3af4ce73698dd00a3defd1e29b295e262ac35e"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.919/veryfront-macos-x64"
      sha256 "478221548ee44c653a2d001a6a47e70eeaef8facec1a6b100ea2c4f650203355"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.919/veryfront-linux-arm64"
      sha256 "14d07d3bb1bf7834bcc86da3aaf2b9626fe70882e255a77643622a720068cc71"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.919/veryfront-linux-x64"
      sha256 "515a35b128286dbd7c3d65f8434f7a40f5ddba83a772b0f8a818abf1b3651754"
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
