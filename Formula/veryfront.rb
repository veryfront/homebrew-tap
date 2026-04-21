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
  version "0.1.234"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.234/veryfront-macos-arm64"
      sha256 "2db67f72f272600c9356954049121b76333a828fc90eef4b5e8e83d5a8099baf"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.234/veryfront-macos-x64"
      sha256 "c5b7e530c7bdd85f664a93a045e30e7b14c557a3eba7ff0b0561d447e058be63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.234/veryfront-linux-arm64"
      sha256 "c9bd295cd7d8f2fedba9082708742154f1bba9e403d9b4aa409a5c5b667d2f0b"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.234/veryfront-linux-x64"
      sha256 "8969d14ec534fd650fbce38c61f11fc3e30ef774d060f6d34c06f72e4fd71fe9"
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
