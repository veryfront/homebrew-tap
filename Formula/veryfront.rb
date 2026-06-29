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
  version "0.1.974"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.974/veryfront-macos-arm64"
      sha256 "583801fc10fe7dac34484396abdcec0df831df7e28767d01298988a02d829e63"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.974/veryfront-macos-x64"
      sha256 "59573e42d94068d6cb4ffd520eb00f5ac63bdf2b5b3a77c695f9f8422b7696b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.974/veryfront-linux-arm64"
      sha256 "a753e1a2193be0b4a4ab79c653e78c00cbb56e39d6a3c643e7413fea246c503a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.974/veryfront-linux-x64"
      sha256 "e12f684c8a435010a0544a6045b7d06ac3f818c04a7f01dcf99831d856438536"
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
