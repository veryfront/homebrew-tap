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
  version "0.1.366"

  on_macos do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.366/veryfront-macos-arm64"
      sha256 "12a6634d380e3046d9a961b56825113312d41d8ee274b52031ffc45c43de4fbc"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.366/veryfront-macos-x64"
      sha256 "0dc43f3a9320c8009ef32025c5e4928c6cf76c53f097b13594f9cfd38821c241"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.366/veryfront-linux-arm64"
      sha256 "a0579a961568c888e9ec6652e2f07df548c2f53dec29937f41b5209472d948d3"
    end
    on_intel do
      url "https://github.com/veryfront/veryfront/releases/download/v0.1.366/veryfront-linux-x64"
      sha256 "efaf01c90536ab1867ad5bae015ff33a05a1edb6768134271cb964d1a77045f6"
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
