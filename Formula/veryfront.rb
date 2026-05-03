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
  version "0.1.362"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.362/veryfront-macos-arm64"
      sha256 "6cbc022b9b72d8b8a748e9f01e825328c69429bf409bc79136fd6b2086dffc4a"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.362/veryfront-macos-x64"
      sha256 "efd9c6df63a361b704da371245cbd4ce47c974417e25f53248fd95963c33ce75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.362/veryfront-linux-arm64"
      sha256 "f555feab6d3c3732a718fc1f6be4d1c38606ca0189797947c013f807ff7c6842"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.362/veryfront-linux-x64"
      sha256 "d605fefe2dcd754e8e1c3a6fc0f039b2060eeaf12f66863a78adc6514ab56cf2"
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
