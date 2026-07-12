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
  version "0.1.1051"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1051/veryfront-macos-arm64"
      sha256 "9f86faa1d7df24d1d28513cd5901b65fcb6d3f2fce51ccf662e42ab0441af41d"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1051/veryfront-macos-x64"
      sha256 "8ebbd08f72b3b9af3f45f4494fe8edcf8a43c04a7cebd0ddaa361656a379e569"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1051/veryfront-linux-arm64"
      sha256 "6ec3e720293839f4d1d744b4adf55ea48972381be9797b03a05a6cc72d86df55"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.1051/veryfront-linux-x64"
      sha256 "33ce73db1e1623b1320b1a3e3658d98bf4612b034d8f3ba89ad231edc39e6b6e"
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
